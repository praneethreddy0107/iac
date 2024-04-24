variable "input_string" {
  description = "Input string for string function examples"
  default     = "hello world\n"
}

variable "file_content" {
  description = "String read from a file"
  default     = "this is some text\n"
}

variable "list_of_strings" {
  description = "List of strings for formatlist function"
  default     = ["apple", "banana", "cherry"]
}

variable "prefix" {
  description = "Prefix to trim"
  default     = "prefix_"
}

variable "suffix" {
  description = "Suffix to trim"
  default     = "_suffix"
}

variable "text_with_spaces" {
  description = "Text with leading and trailing spaces"
  default     = "  some text with spaces  "
}


variable "string1" {
  description = "First string for concatenation"
  default     = "hello"
}

variable "string2" {
  description = "Second string for concatenation"
  default     = "world"
}
