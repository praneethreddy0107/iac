# Encoding Functions Examples

# Define sample variables for demonstration purposes
variable "input_text" {
  description = "Input text for encoding functions"
  default     = "Hello, World!"
}

variable "json_data" {
  description = "JSON data for encoding functions"
  default     = {
    key1 = "value1"
    key2 = "value2"
  }
}

variable "yaml_data" {
  description = "YAML data for encoding functions"
  default     = "key1: value1\nkey2: value2"
}
