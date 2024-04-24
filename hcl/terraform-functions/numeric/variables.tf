variable "num_list" {
    type=list 
  description = "A list of numbers"
  default     = [23, 2, 3, 4, 5,-34,-5,5.3,4.9]
}
variable "num_map" {
  description = "A map of numbers"
  default     = {
    a = 1
    b = 2
    c = 3
    d = 4
    e = 5
  }
}
variable "number" {
    type=number
    default=-40
    description="any number "
}