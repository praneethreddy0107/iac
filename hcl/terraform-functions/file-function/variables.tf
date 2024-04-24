# Filesystem Functions Examples

# Define sample variables for demonstration purposes
variable "file_path" {
  description = "File path for filesystem functions"
  default     = "variables.tf"
}

variable "template_vars" {
  description = "Variables for templatefile function"
  default     = {
    variable1 = "value1"
    variable2 = "value2"
  }
}