using CommunityToolkit.Mvvm.ComponentModel;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace xclsvApp.ViewModel
{
    public partial class HomeViewModel : ObservableObject
    {
        [ObservableProperty]
        private string money;

        [ObservableProperty]
        private string firstLabelText;

        [ObservableProperty]
        private string secondLabelText;

        [ObservableProperty]
        private string thirdLabelText;

        public HomeViewModel()
        {
            DisplayLabels();
        }

        private async void DisplayLabels()
        {
            await Task.Delay(400);
            Money = $"Pénzügyi kimutatás: {OrdersViewModel.GetPrice()} Ft";
            FirstLabelText = $"Jelenleg {ProductsViewModel.GetProductCount()} darab termék található a nyilvántartásban!";
            SecondLabelText = $"Top 5 termék: \n{OrdersViewModel.GetTopFiveProducts()}";
            ThirdLabelText = $"XCLSV társaság";
        }
    }
}
