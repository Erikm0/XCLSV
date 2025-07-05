using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace xclsvApp.Model
{
    public class ProductModel
    {
        [JsonPropertyName("id")]
        public int Id { get; set; }

        [JsonPropertyName("name")]
        public string Name { get; set; }

        [JsonPropertyName("category")]
        public string Category { get; set; }

        [JsonPropertyName("description")]
        public string Description { get; set; }

        [JsonPropertyName("product_color")]
        public string ProductColor { get; set; }

        [JsonPropertyName("product_image")]
        public string ProductImage { get; set; }

        [JsonPropertyName("size")]
        public string Size { get; set; }

        [JsonPropertyName("price")]
        [JsonConverter(typeof(JsonStringToDecimalConverter))]
        public decimal Price { get; set; }

        [JsonPropertyName("stock")]
        public int Stock { get; set; } // 0 vagy 1 -> true false

        [JsonPropertyName("created_at")]
        public DateTime Created_at { get; set; }

        [JsonPropertyName("updated_at")]
        public DateTime? Updated_at { get; set; }

        [JsonPropertyName("deleted_at")]
        public DateTime? Deleted_at { get; set; }


    }

    public class JsonStringToDecimalConverter : JsonConverter<decimal>
    {
        public override decimal Read(ref Utf8JsonReader reader, Type typeToConvert, JsonSerializerOptions options)
        {
            if (reader.TokenType == JsonTokenType.String &&
                decimal.TryParse(reader.GetString(), out var value))
            {
                return value;
            }

            return reader.GetDecimal();
        }

        public override void Write(Utf8JsonWriter writer, decimal value, JsonSerializerOptions options)
        {
            writer.WriteNumberValue(value);
        }
    }

}
