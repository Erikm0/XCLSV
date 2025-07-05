using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace xclsvApp.Model
{
    public class OrderModel
    {
        [JsonPropertyName("id")]
        public int OrderId { get; set; }
        [JsonPropertyName("product_image")]
        public string ProductImage { get; set; }
        [JsonPropertyName("name")]
        public string ProductName { get; set; }
        [JsonPropertyName("quantity")]
        public int Quantity { get; set; }
        [JsonPropertyName("price")]
        [JsonConverter(typeof(JsonStringToDecimalConverter))]
        public decimal Price { get; set; }
        [JsonPropertyName("status_code")]
        public string StatusCode { get; set; }
        [JsonPropertyName("order_date")]
        public string OrderDate { get; set; }
        
    }
}
