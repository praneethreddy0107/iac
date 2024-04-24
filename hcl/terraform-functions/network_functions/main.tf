# IP Network Functions Examples

# Define sample variables for demonstration purposes
variable "cidr_block" {
  description = "CIDR block for IP network functions"
  default     = "10.0.0.0/16"
}

variable "subnet_bits" {
  description = "Number of subnet bits"
  default     = 8
}

variable "subnet_index" {
  description = "Subnet index"
  default     = 0
}

# Define local value to store the current timestamp
locals {
  current_timestamp = timestamp()
}

# cidrhost Function
# Returns the Nth IP address in a CIDR range.
# Syntax: cidrhost(cidr_block, host_number)
# Arguments: cidr_block - The CIDR block.
#            host_number - The Nth IP address.

output "host_ip" {
  value = cidrhost(var.cidr_block, 10)
}

# cidrnetmask Function
# Returns the netmask of a CIDR block.
# Syntax: cidrnetmask(cidr_block)
# Arguments: cidr_block - The CIDR block.

output "netmask" {
  value = cidrnetmask(var.cidr_block)
}

# cidrsubnet Function
# Returns a subnet address within a CIDR block.
# Syntax: cidrsubnet(parent_cidr_block, new_bits, subnet_number)
# Arguments: parent_cidr_block - The parent CIDR block.
#            new_bits - The number of new bits for the subnet.
#            subnet_number - The subnet index.

output "subnet_cidr" {
  value = cidrsubnet(var.cidr_block, var.subnet_bits, var.subnet_index)
}

# cidrsubnets Function
# Returns a list of subnet addresses within a CIDR block.
# Syntax: cidrsubnets(parent_cidr_block, new_bits, count)
# Arguments: parent_cidr_block - The parent CIDR block.
#            new_bits - The number of new bits for each subnet.
#            count - The number of subnets.

output "subnets" {
  value = cidrsubnets(var.cidr_block, 8, 4) # Divides the CIDR block into 4 subnets
}
