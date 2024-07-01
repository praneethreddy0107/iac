
locals {
  network = (var.vpc_create ?
    try(google_compute_network.network, 0, null) :
  try(data.google_compute_network.network.0, null))
}

data "google_compute_network" "network" {
  count   = var.vpc_create ? 0 : 1
  name    = var.network_name
  project = var.project_id
}

resource "google_compute_network" "network" {
  name                                      = var.network_name
  auto_create_subnetworks                   = var.auto_create_subnetworks
  delete_default_routes_on_create           = var.delete_default_internet_gateway_routes
  mtu                                       = var.mtu
  routing_mode                              = var.routing_mode
  project                                   = var.project_id
  description                               = var.description
  enable_ula_internal_ipv6                  = var.enable_ipv6_ula
  network_firewall_policy_enforcement_order = var.network_firewall_policy_enforcement_order

  internal_ipv6_range = var.internal_ipv6_range
}

