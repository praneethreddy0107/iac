resource "google_compute_instance_template" "instance" {
  count                 = var.create_template ? 1 : 0
  project               = var.project_id
  region                = local.region
  name_prefix           = "${var.name}-"
  description           = var.description
  tags                  = var.tags
  machine_type          = var.instance_type
  min_cpu_platform      = var.min_cpu_platform
  can_ip_forward        = var.can_ip_forward
  metadata              = var.metadata
  labels                = var.labels
  resource_manager_tags = local.tags_combined

  disk {
    auto_delete           = var.boot_disk.auto_delete
    boot                  = true
    disk_size_gb          = var.boot_disk.initialize_params.size
    disk_type             = var.boot_disk.initialize_params.type
    resource_manager_tags = var.tag_bindings
    source_image          = var.boot_disk.initialize_params.image
  }

  dynamic "confidential_instance_config" {
    for_each = var.confidential_compute ? [""] : []
    content {
      enable_confidential_compute = true
    }
  }

 

  dynamic "network_interface" {
    for_each = var.network_interfaces
    iterator = config
    content {
      network    = config.value.network
      subnetwork = config.value.subnetwork
      network_ip = try(config.value.addresses.internal, null)
      nic_type   = config.value.nic_type
      stack_type = config.value.stack_type
      dynamic "access_config" {
        for_each = config.value.nat ? [""] : []
        content {
          nat_ip = try(config.value.addresses.external, null)
        }
      }
      dynamic "alias_ip_range" {
        for_each = config.value.alias_ips
        iterator = config_alias
        content {
          subnetwork_range_name = config_alias.key
          ip_cidr_range         = config_alias.value
        }
      }
    }
  }


  scheduling {
    automatic_restart           = !var.options.spot
    instance_termination_action = local.termination_action
    on_host_maintenance         = local.on_host_maintenance
    preemptible                 = var.options.spot
    provisioning_model          = var.options.spot ? "SPOT" : "STANDARD"

    dynamic "node_affinities" {
      for_each = var.options.node_affinities
      iterator = affinity
      content {
        key      = affinity.key
        operator = affinity.value.in ? "IN" : "NOT_IN"
        values   = affinity.value.values
      }
    }
  }

  dynamic "service_account" {
    for_each = var.service_account == null ? [] : [""]
    content {
      email  = local.service_account.email
      scopes = local.service_account.scopes
    }
  }

  dynamic "shielded_instance_config" {
    for_each = var.shielded_config != null ? [var.shielded_config] : []
    iterator = config
    content {
      enable_secure_boot          = config.value.enable_secure_boot
      enable_vtpm                 = config.value.enable_vtpm
      enable_integrity_monitoring = config.value.enable_integrity_monitoring
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}
