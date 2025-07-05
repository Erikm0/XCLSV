using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Microsoft.Maui;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Diagnostics;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using xclsvApp.Context;
using xclsvApp.Model;
using xclsvApp.Pages;
using xclsvApp.Service;
using xclsvApp.View;

namespace xclsvApp.ViewModel
{
    public partial class ProductsViewModel : ObservableObject
    {
        
        private DbService service;

        [ObservableProperty]
        private ObservableCollection<ProductModel>? products;

        private static int productCount = -1;
        public static int GetProductCount()
        {
            return productCount;
        }

        private static string topFiveProducts = string.Empty;
        public static string GetTopFiveProducts()
        {
            return topFiveProducts;
        }

        [ObservableProperty]
        private int newId;
        [ObservableProperty]
        private string newName;
        [ObservableProperty]
        private string newCategory;
        [ObservableProperty]
        private string newDescription;
        [ObservableProperty]
        private string newProductColor;
        [ObservableProperty]
        private string newProductImage;
        [ObservableProperty]
        private string newSize;
        [ObservableProperty]
        private double newPrice;
        [ObservableProperty]
        private int newStock;

        [ObservableProperty]
        private List<string> categories;

        [ObservableProperty]
        private ProductModel selectedProduct;

        [ObservableProperty]
        private bool responseBoxIsVisible;
        [ObservableProperty]
        private string responseBoxText;
        [ObservableProperty]
        private string responseBoxColor;

        [ObservableProperty]
        private bool isEditing;
        [ObservableProperty]
        private string pageLabel;


        private string searchText;
        public string SearchText
        {
            get => searchText;
            set
            {
                if(searchText != value)
                {
                    searchText = value;
                    OnPropertyChanged(nameof(SearchText));
                    FilterList();
                }
            }
        }

        public ProductsViewModel()
        {
            service = new DbService();
            Categories = new List<string>
            {
                "Nadrág",
                "Rövidnadrág",
                "Farmer",
                "Pulóver",
                "Kapucnis pulóver",
                "Környakú pulóver",
                "Sapka",
                "Rövid ujjú póló",
                "Hosszú ujjú póló",
                "Ing",
                "Dzseki",
                "Cipő"
            };
            isEditing = false;
            LoadProducts();
        }

        [RelayCommand]
        public async Task LoadProducts()
        {
            Products = await service.GetProducts();

            productCount = Products.Count;
            topFiveProducts = string.Join("\n", Products.OrderByDescending(p => p.Price).Take(5)
                .Select(p => p.Name + $"  ID: {p.Id}."));

            EmptyNewValues();
        }


        private void FilterList()
        {
            if (string.IsNullOrWhiteSpace(SearchText))
            {
                LoadProducts();
            }
            else
            {
                var filteredProducts = Products
                    .Where(p => p.Name.ToLower().Contains(SearchText.ToLower()))
                    .ToList();
                Products = new ObservableCollection<ProductModel>(filteredProducts);
            }

        }


        [RelayCommand]
        public async Task NavigateToAddEditProduct(ProductModel? p)
        {
            var page = new AddEditProductPage();
            NavigationPage.SetHasBackButton(page, false);
            page.BindingContext = this;

            if (p == null)
            {
                PageLabel = "Termék hozzáadása";
                EmptyNewValues();

                await Application.Current.MainPage.Navigation.PushAsync(page);
            }
            else
            {
                IsEditing = true;
                SelectedProduct = p;

                PageLabel = $"{p.Name} szerkesztése";

                // az entry mezőket kitöltjük a termék adataival
                NewId = p.Id;
                NewName = p.Name;
                NewCategory = p.Category;
                NewDescription = p.Description;
                NewProductColor = p.ProductColor;
                NewProductImage = p.ProductImage;
                NewSize = p.Size;
                NewPrice = (double)p.Price;
                NewStock = p.Stock;

                await Application.Current.MainPage.Navigation.PushAsync(page);
            }
        }

        [RelayCommand]
        public async Task BackFromAddProduct()
        {
            EmptyNewValues();
            await Application.Current.MainPage.Navigation.PopAsync();
            ResponseBoxIsVisible = false;

        }

        private void EmptyNewValues()
        {
            SelectedProduct = null;
            NewId = 0;
            NewName = "";
            NewCategory = "";
            NewDescription = "";
            NewProductColor = "";
            NewProductImage = "";
            NewSize = "";
            NewPrice = 0;
            NewStock = 0;
        }

        private bool ValidateProduct()
        {
            if (NewName != string.Empty && NewCategory != string.Empty && NewDescription != string.Empty 
                && NewProductColor != string.Empty
                    && NewProductImage != string.Empty && NewSize != string.Empty && NewPrice > 0 
                    && (NewStock == 1 || NewStock == 0))
            {
                ResponseBoxText = "A termék sikeresen frissült!";
                ResponseBoxColor = "Green";
                ResponseBoxIsVisible = true;
                return true;
            }
            ResponseBoxText = "Kérlek az összes mezőt töltsd ki helyesen!";
            ResponseBoxColor = "Red";
            ResponseBoxIsVisible = true;
            return false;
        }

        [RelayCommand]
        public async Task DeleteProduct(ProductModel product)
        {
            product.Deleted_at = DateTime.Now;
            await service.DeleteProduct(product);
            await LoadProducts();
        }

        [RelayCommand]
        public async Task AddUpdateProduct()
        {
            if (IsEditing == true)
            {
                // Szerkesztés
                if (ValidateProduct())
                {
                    ProductModel editedProduct = new ProductModel
                    {
                        Id = NewId,
                        Name = NewName,
                        Category = NewCategory,
                        Description = NewDescription,
                        ProductColor = NewProductColor,
                        ProductImage = NewProductImage,
                        Size = NewSize,
                        Price = (decimal)NewPrice,
                        Stock = NewStock,
                        Created_at = SelectedProduct.Created_at,
                        Updated_at = DateTime.Now,
                        Deleted_at = null
                    };
                    await service.UpdateProduct(editedProduct);
                    IsEditing = false;
                }

            }
            else
            {
                // Hozzáadás
                if (ValidateProduct())
                {
                    if(NewProductImage == null)
                    {
                        var aws = new AwsService();
                        // ha a felhasználó nem ad meg képet egy placeholder képet kap a termék
                        FileResult res = new FileResult("C:\\Users\\Gamer\\Source\\Repos\\xclsvKft\\xclsvApp\\Resources\\Images\\placeholder.png");
                        string imageUrl = await aws.UploadImageAsync(res);

                        NewProductImage = imageUrl;
                    }
                    ProductModel newProduct = new ProductModel
                    {
                        Name = NewName,
                        Category = NewCategory,
                        Description = NewDescription,
                        ProductColor = NewProductColor,
                        ProductImage = NewProductImage,
                        Size = NewSize,
                        Price = (decimal)NewPrice,
                        Stock = NewStock,
                        Created_at = DateTime.Now,
                        Updated_at = DateTime.Now,
                        Deleted_at = null
                    };
                    await service.AddProduct(newProduct);
                    EmptyNewValues();
                }
            }
        }

        [RelayCommand]
        public async void PickAndUploadImage()
        {
            var aws = new AwsService();

            var result = await FilePicker.PickAsync(new PickOptions
            {
                PickerTitle = "Válasszon egy képet",
                FileTypes = FilePickerFileType.Images
            });

            if (result != null)
            {
                string imageUrl = await aws.UploadImageAsync(result);

                NewProductImage = imageUrl;
            }
        }




        // SearchBar frissítése
        public event PropertyChangedEventHandler PropertyChanged;

        protected void OnPropertyChanged([CallerMemberName] string propertyName = null) =>
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
    }
}
