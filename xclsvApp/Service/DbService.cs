using CommunityToolkit.Mvvm.ComponentModel;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using xclsvApp.Context;
using xclsvApp.Model;

namespace xclsvApp.Service
{
    public class DbService : ObservableObject
    {
        private ApiContext apiContext;

        public DbService()
        {
            apiContext = new ApiContext();
        }


        #region Products
        public async Task<ObservableCollection<ProductModel>> GetProducts()
        {
            ObservableCollection<ProductModel> products = new ObservableCollection<ProductModel>();
            var lista = await apiContext.GetProductsAsync();
            foreach (var product in lista)
                products.Add(product);
            return products;
        }

        public async Task AddProduct(ProductModel product)
        {
            await apiContext.AddProductAsync(product);
        }

        public async Task DeleteProduct(ProductModel product)
        {
            await apiContext.DeleteProductAsync(product);
        }

        public async Task UpdateProduct(ProductModel product)
        {
            ProductModel oldProduct = apiContext.Products.FirstOrDefault(p => p.Id == product.Id);
            if (oldProduct != null)
            {
                oldProduct.Name = product.Name;
                oldProduct.Category = product.Category;
                oldProduct.Description = product.Description;
                oldProduct.ProductColor = product.ProductColor;
                oldProduct.ProductImage = product.ProductImage;
                oldProduct.Size = product.Size;
                oldProduct.Price = product.Price;
                oldProduct.Stock = product.Stock;
                oldProduct.Created_at = product.Created_at;
                oldProduct.Updated_at = product.Updated_at == null ? null : product.Updated_at;
                oldProduct.Deleted_at = product.Deleted_at;
                
                await apiContext.UpdateProductAsync(oldProduct);
            }
        }

        #endregion


        #region Admin
        public async Task<ObservableCollection<AdminModel>> GetAdmins()
        {
            ObservableCollection<AdminModel> admins = new ObservableCollection<AdminModel>();
            var lista = await apiContext.GetAdminsAsync();
            foreach (var admin in lista)
                admins.Add(admin);
            return admins;
        }
        #endregion

        
        #region Orders

        public async Task<ObservableCollection<OrderModel>> GetOrders()
        {
            ObservableCollection<OrderModel> orders = new ObservableCollection<OrderModel>();
            var lista = await apiContext.GetOrdersAsync();
            foreach (var order in lista)
                orders.Add(order);
            return orders;
        }


        #endregion
    }
}
