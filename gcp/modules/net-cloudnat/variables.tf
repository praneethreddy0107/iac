

variable "addresses" {
  description = "Optional list of external address self links."
  type        = list(string)
  default     = []
}




variable "config_timeouts" {
  description = "Timeout configurations."
  type = object({
    icmp            = optional(number, 30)
    tcp_established = optional(number, 1200)
    tcp_time_wait   = optional(number, 120)
    tcp_transitory  = optional(number, 30)
    udp             = optional(number, 30)
  })
  default  = {}
  nullable = false
}

variable "logging_filter" {
  description = "Enables logging if not null, value is one of 'ERRORS_ONLY', 'TRANSLATIONS_ONLY', 'ALL'."
  type        = string
  default     = null
}

variable "name" {
  description = "Name of the Cloud NAT resource."
  type        = string
}

variable "project_id" {
  description = "Project where resources will be created."
  type        = string
}

variable "region" {
  description = "Region where resources will be created."
  type        = string
}

variable "router_asn" {
  description = "Router ASN used for auto-created router."
  type        = number
  default     = null
}

variable "router_create" {
  description = "Create router."
  type        = bool
  default     = true
}

variable "router_name" {
  description = "Router name, leave blank if router will be created to use auto generated name."
  type        = string
  default     = null
}

variable "router_network" {
  description = "Name of the VPC used for auto-created router."
  type        = string
  default     = null
}

variable "rules" {
  description = "List of rules associated with this NAT."
  type = list(object({
    description = optional(string),
    match       = string
    source_ips  = list(string)
  }))
  default  = []
  nullable = false
}

variable "config_port_allocation" {
  description = "Configuration for how to assign ports to virtual machines. min_ports_per_vm and max_ports_per_vm have no effect unless enable_dynamic_port_allocation is set to 'true'."
  type = object({
    enable_endpoint_independent_mapping = optional(bool, true)
    enable_dynamic_port_allocation      = optional(bool, false)
    min_ports_per_vm                    = optional(number, 64)
    max_ports_per_vm                    = optional(number, 65536)
  })
  default  = {}
  nullable = false
  validation {
    condition     = var.config_port_allocation.enable_dynamic_port_allocation ? var.config_port_allocation.enable_endpoint_independent_mapping == false : true
    error_message = "You must set enable_endpoint_independent_mapping to false to set enable_dynamic_port_allocation to true."
  }
}

variable "config_source_subnetworks" {
  description = "Subnetwork configuration."
  type = object({
    all                 = optional(bool, true)
    primary_ranges_only = optional(bool)
    subnetworks = optional(list(object({
      self_link        = string
      all_ranges       = optional(bool, true)
      secondary_ranges = optional(list(string))
    })), [])
  })
  nullable = false
  default  = {}
}
