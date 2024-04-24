
# base64decode Function
# Decodes a base64-encoded string.
# Syntax: base64decode(encoded_string)
# Arguments: encoded_string - The base64-encoded string to decode.

output "decoded_base64" {
  value = base64decode("SGVsbG8sIFdvcmxkIQ==")
}

# base64encode Function
# Encodes a string to base64.
# Syntax: base64encode(input_string)
# Arguments: input_string - The string to encode.

output "encoded_base64" {
  value = base64encode(var.input_text)
}

# base64gzip Function
# Compresses a string using gzip and then encodes it to base64.
# Syntax: base64gzip(input_string)
# Arguments: input_string - The string to compress and encode.

output "encoded_base64_gzip" {
  value = base64gzip(var.input_text)
}

# csvdecode Function
# Parses a CSV string into a list of maps.
# Syntax: csvdecode(csv_string)
# Arguments: csv_string - The CSV string to decode.

output "csv_decoded" {
  value = csvdecode("name,age\nJohn,30\nJane,25")
}

# jsondecode Function
# Parses a JSON string into a map or list.
# Syntax: jsondecode(json_string)
# Arguments: json_string - The JSON string to decode.

output "json_decoded" {
  value = jsondecode("{\"key1\":\"value1\",\"key2\":\"value2\"}")
}

# jsonencode Function
# Converts a map or list to a JSON string.
# Syntax: jsonencode(input_data)
# Arguments: input_data - The map or list to encode.

output "json_encoded" {
  value = jsonencode(var.json_data)
}
# textdecodebase64 Function
# Decodes a base64-encoded string.
# Syntax: textdecodebase64(encoded_string, encoding)
# Arguments: encoded_string - The base64-encoded string to decode.
#            encoding - The encoding type (optional, default is "utf-8").

output "text_decoded_base64" {
  value = textdecodebase64("SGVsbG8sIFdvcmxkIQ==", "utf-8")
}

# textencodebase64 Function
# Encodes a string to base64.
# Syntax: textencodebase64(input_string, encoding)
# Arguments: input_string - The string to encode.
#            encoding - The encoding type (optional, default is "utf-8").

output "text_encoded_base64" {
  value = textencodebase64(var.input_text, "utf-8")
}

# urlencode Function
# Encodes a string for use in a URL.
# Syntax: urlencode(input_string)
# Arguments: input_string - The string to encode.

output "url_encoded" {
  value = urlencode("Hello, World!")
}

# yamldecode Function
# Parses a YAML string into a map or list.
# Syntax: yamldecode(yaml_string)
# Arguments: yaml_string - The YAML string to decode.

output "yaml_decoded" {
  value = yamldecode(var.yaml_data)
}

# yamlencode Function
# Converts a map or list to a YAML string.
# Syntax: yamlencode(input_data)
# Arguments: input_data - The map or list to encode.

output "yaml_encoded" {
  value = yamlencode(var.json_data)
}
