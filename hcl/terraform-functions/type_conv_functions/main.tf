# Type Conversion Functions Examples
variable "timestamp" {
  type        = string 
  default=null

  #validation {
    # formatdate fails if the second argument is not a valid timestamp
    #condition     = can(formatdate("", var.timestamp))
  #  error_message = "The timestamp argument requires a valid RFC 3339 timestamp."
 # }
}

# Define sample variables for demonstration purposes
variable "numeric_string" {
  description = "Numeric string for type conversion functions"
  default     = "123"
}

variable "bool_string" {
  description = "Boolean string for type conversion functions"
  default     = "true"
}

variable "number" {
  description = "Number for type conversion functions"
  default     = 123
}

# tonumber Function
# Converts a string to a number.
# Syntax: tonumber(string)
# Arguments: string - The string to convert.

output "converted_number" {
  value = tonumber(var.numeric_string)
}

# tobool Function
# Converts a string to a boolean.
# Syntax: tobool(string)
# Arguments: string - The string to convert.

output "converted_boolean" {
  value = tobool(var.bool_string)
}

# tostring Function
# Converts a value to a string.
# Syntax: tostring(value)
# Arguments: value - The value to convert.

output "converted_string" {
  value = tostring(var.number)
}

# tolist Function
# Converts a value to a list.
# Syntax: tolist(value)
# Arguments: value - The value to convert.

output "converted_list" {
  value = tolist([var.number]) # Convert var.number into a single-element list
}

# toset Function
# Converts a value to a set.
# Syntax: toset(value)
# Arguments: value - The value to convert.

output "converted_set" {
  value = toset([var.number]) # Convert var.number into a single-element set
}

# tomap Function
# Converts a value to a map.
# Syntax: tomap(value)
# Arguments: value - The value to convert.

output "converted_map" {
  value = tomap({ "key" = var.number }) # Convert var.number into a single-element map
}

# issensitive Function
# Checks if a value is sensitive.
# Syntax: issensitive(value)
# Arguments: value - The value to check.

output "is_sensitive" {
  value = issensitive("sensitive_value")
}
# Define sample variables for demonstration purposes
variable "value1" {
  description = "First value for try function"
  default     = "123"
  type=number
}

variable "value2" {
  description = "Second value for try function"
  default     = 123
}

variable "value3" {
  description = "Third value for try function"
  default     = true
}

# Use the try function to evaluate different types of values
output "try_output" {
  value = try(
    var.value1, # Attempt to use var.value1
    var.value2, # If var.value1 produces an error, try var.value2
    var.value3  # If var.value2 also produces an error, try var.value3
  )
}

# Use the type function to determine the type of a given value
#output "type_output" {
 # value = type(var.value1) # Returns the type of var.value1
#}
