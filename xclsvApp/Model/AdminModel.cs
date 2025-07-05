using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace xclsvApp.Model
{
    public class AdminModel
    {
        [JsonPropertyName("id")]
        public int Id { get; set; }
        [JsonPropertyName("email")]
        public string Email { get; set; }
        [JsonPropertyName("password_hash")]
        public string Password { get; set; }
        [JsonPropertyName("created_at")]
        public DateTime Created_at { get; set; }
        [JsonPropertyName("updated_at")]
        public DateTime? Updated_at { get; set; }
        [JsonPropertyName("deleted_at")]
        public DateTime? Deleted_at { get; set; }
    }
}
