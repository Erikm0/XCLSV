using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Diagnostics;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using xclsvApp.Model;
using xclsvApp.Pages;
using xclsvApp.Service;

namespace xclsvApp.ViewModel
{
    public partial class OrdersViewModel : ObservableObject
    { 
        private DbService service;

        [ObservableProperty]
        private ObservableCollection<OrderModel>? orderCollection;

        // Azért static, hogy a Main Page-n is elérjem
        [ObservableProperty]
        private static decimal totalPrice;
        public static decimal GetPrice()
        {
            return totalPrice;
        }

        [ObservableProperty]
        private static string topFiveProducts = string.Empty;
        public static string GetTopFiveProducts()
        {
            return topFiveProducts;
        }

        private string searchText;
        public string SearchText
        {
            get => searchText;
            set
            {
                if (searchText != value)
                {
                    searchText = value;
                    OnPropertyChanged(nameof(SearchText));
                    FilterList();
                }
            }
        }

        public OrdersViewModel()
        {
            service = new DbService();
            LoadContent();
            
        }

        [RelayCommand]
        public async Task LoadContent()
        {
            OrderCollection = await service.GetOrders();
            
            foreach (var order in OrderCollection)
            {
                TotalPrice += (decimal)order.Price;
                // Átváltjuk a model-ben a status code-ot szám helyett a megfelelő ikonra
                if (order.StatusCode == "1" || order.StatusCode == "2")
                {
                    order.StatusCode = "delivery_car_pending.png";
                }
                else if(order.StatusCode == "3" || order.StatusCode == "4")
                {
                order.StatusCode = "delivery_car_done.png";
                }
            }

            FilterTopFiveProducts();
        }

        private void FilterTopFiveProducts()
        {
            // Kiválasztja az öt legnagyobb bevételt hozó terméket
            var topFive = OrderCollection
                .GroupBy(o => o.ProductName)
                .Select(g => new { ProductName = g.Key, TotalPrice = g.Sum(o => o.Price) })
                .OrderByDescending(g => g.TotalPrice)
                .Take(5)
                .ToList();
            StringBuilder sb = new StringBuilder();
            foreach (var item in topFive)
            {
                // AppendLine, hogy minden termék új sorba kerüljön
                sb.AppendLine($"{item.ProductName}");
            }
            TopFiveProducts = sb.ToString();
        }

        private void FilterList()
        {
            if (string.IsNullOrEmpty(SearchText))
            {
                LoadContent();
            }
            else
            {
                var filteredList = OrderCollection
                    .Where(o => o.ProductName.ToLower().Contains(SearchText.ToLower()))
                    .ToList();
                OrderCollection = new ObservableCollection<OrderModel>(filteredList);
            }
        }



        public event PropertyChangedEventHandler PropertyChanged;
        protected void OnPropertyChanged([CallerMemberName] string propertyName = null) =>
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
    }
}
