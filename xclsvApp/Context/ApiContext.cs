using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using xclsvApp.Model;

namespace xclsvApp.Context
{
    public class ApiContext
    {
        private HttpClient _client;
        private JsonSerializerOptions _serializerOptions;

        private string uriString = "http://127.0.0.1:8000";
        private string bycryptUriString = "https://www.toptal.com/developers/bcrypt/api/check-password.json";

        public List<ProductModel> Products { get; private set; }
        public List<AdminModel> Admins { get; private set; }
        public List<OrderModel> FullOrders { get; private set; }


        public ApiContext()
        {
            _client = new HttpClient();
            _serializerOptions = new JsonSerializerOptions
            {
                PropertyNameCaseInsensitive = true
            };

            Products = new List<ProductModel>();
            Admins = new List<AdminModel>();
            FullOrders = new List<OrderModel>();
        }

        #region Products
        public async Task<List<ProductModel>> GetProductsAsync()
        {
            Uri uri = new Uri($"{uriString}/api/productsIndex");

            try
            {
                HttpResponseMessage responseMessage = await _client.GetAsync(uri);

                string content = await responseMessage.Content.ReadAsStringAsync();

                if (!responseMessage.IsSuccessStatusCode)
                {
                    Debug.WriteLine($"HTTP ERROR: {(int)responseMessage.StatusCode} - {responseMessage.ReasonPhrase}");
                    return null;
                }

                Products = JsonSerializer.Deserialize<List<ProductModel>>(content, _serializerOptions);
                return Products;
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"\t ERROR {ex.Message}");
                return null;
            }
        }

        public async Task AddProductAsync(ProductModel product)
        {
            Uri uri = new Uri($"{uriString}/api/productsUpload");
            try
            {
                string json = JsonSerializer.Serialize<ProductModel>(product, _serializerOptions);
                StringContent content = new StringContent(json, Encoding.UTF8, "application/json");

                HttpResponseMessage response = await _client.PostAsync(uri, content);
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"\t ERROR {ex.Message}");
            }
        }

        public async Task UpdateProductAsync(ProductModel product)
        {
            Uri uri = new Uri($"{uriString}/api/productsUpdate/{product.Id}");
            try
            {
                string json = JsonSerializer.Serialize<ProductModel>(product, _serializerOptions);
                StringContent content = new StringContent(json, Encoding.UTF8, "application/json");

                HttpResponseMessage response = await _client.PutAsync(uri, content);
                if (response.IsSuccessStatusCode)
                {
                    Debug.WriteLine("Product updated successfully.");
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"\t ERROR {ex.Message}");
            }
        }

        public async Task DeleteProductAsync(ProductModel product)
        {
            Uri uri = new Uri($"{uriString}/api/productsDelete");
            try
            {
                HttpResponseMessage response = await _client.DeleteAsync($"{uri}/{product.Id}");
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"\t ERROR {ex.Message}");
            }
        }
        #endregion

        #region Admins

        public async Task<List<AdminModel>> GetAdminsAsync()
        {
            Uri uri = new Uri($"{uriString}/api/adminsIndex");
            try
            {
                HttpResponseMessage responseMessage = await _client.GetAsync(uri);

                string content = await responseMessage.Content.ReadAsStringAsync();

                if (!responseMessage.IsSuccessStatusCode)
                {
                    Debug.WriteLine($"HTTP ERROR: {(int)responseMessage.StatusCode} - {responseMessage.ReasonPhrase}");
                    return null;
                }

                Admins = JsonSerializer.Deserialize<List<AdminModel>>(content, _serializerOptions);
                return Admins;
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"\t ERROR {ex.Message}");
                return null;
            }

        }

        #endregion

        #region Orders

        public async Task<List<OrderModel>> GetOrdersAsync()
        {
            Uri uri = new Uri($"{uriString}/api/ordersIndex");

            try
            {
                HttpResponseMessage responseMessage = await _client.GetAsync(uri);

                string content = await responseMessage.Content.ReadAsStringAsync();

                if (!responseMessage.IsSuccessStatusCode)
                {
                    Debug.WriteLine($"HTTP ERROR: {(int)responseMessage.StatusCode} - {responseMessage.ReasonPhrase}");
                    return null;
                }

                FullOrders = JsonSerializer.Deserialize<List<OrderModel>>(content, _serializerOptions);
                return FullOrders;
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"\t ERROR {ex.Message}");
                return null;
            }

        }

        #endregion
    }
}