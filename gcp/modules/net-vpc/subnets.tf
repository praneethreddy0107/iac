locals {
  subnets = { for subnet in var.subnets :
  "${subnet.subnet_region}/${subnet.subnet_name}" => subnet }
}
resource "google_compute_subnetwork" "subnetwork" {

  for_each = local.subnets
  network  = var.network_name

  name                       = each.value.subnet_name
  ip_cidr_range              = each.value.subnet_ip
  region                     = each.value.subnet_region
  private_ip_google_access   = lookup(each.value, "subnet_private_access", "falsae")
  private_ipv6_google_access = lookup(each.value, "subnet_private_ipv6_access", null)
  stack_type                 = lookup(each.value, "stack_type", null)
  ipv6_access_type           = lookup(each.value, "ipv6_access_type", null)
  dynamic "log_config" {
    for_each = each.value.flow_logs_config != null ? [""] : []
    content {
      aggregation_interval = each.value.flow_logs_config.aggregation_interval
      filter_expr          = each.value.flow_logs_config.filter_expression
      flow_sampling        = each.value.flow_logs_config.flow_sampling
      metadata             = each.value.flow_logs_config.metadata
      metadata_fields = (
        each.value.flow_logs_config.metadata == "CUSTOM_METADATA"
        ? each.value.flow_logs_config.metadata_fields
        : null
      )
    }


  }

  dynamic "secondary_ip_range" {
    for_each = contains(keys(var.secondary_ranges), each.value.subnet_name) == true ? var.secondary_ranges[each.value.subnet_name] : []

    content {
      range_name    = secondary_ip_range.value.range_name
      ip_cidr_range = secondary_ip_range.value.ip_cidr_range
    }
  }
  purpose = lookup(each.value, "purpose", null)
  role    = lookup(each.value, "role", null)
  description = (
    each.value.description == null
    ? "Terraform-managed."
    : each.value.description
  )


  depends_on = [google_compute_network.network]

}

/**
count=length(var.subnets)
  name          = var.subnets[count.index].name
  network       = var.network_name
  region        = var.subnets[count.index].region
  ip_cidr_range = var.subnets[count.index].ip_cidr_range
  */
