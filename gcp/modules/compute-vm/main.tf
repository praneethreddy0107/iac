resource "google_compute_instance" "instance"{
      count                     = var.create_template ? 0 : 1

  project                   = var.project_id
  zone                      = var.zone
  name                      = var.name
  hostname                  = var.hostname
  description               = var.description
  tags                      = var.tags
  machine_type              = var.instance_type
  min_cpu_platform          = var.min_cpu_platform
  can_ip_forward            = var.can_ip_forward
   allow_stopping_for_update = var.options.allow_stopping_for_update
  deletion_protection       = var.options.deletion_protection
  enable_display            = var.enable_display
  labels                    = var.labels
  metadata                  = var.metadata 
  boot_disk {
     auto_delete = (
      var.boot_disk.use_independent_disk
      ? false
      : var.boot_disk.auto_delete
    )
 disk_encryption_key_raw = (
      var.encryption != null ? var.encryption.disk_encryption_key_raw : null
    )

 kms_key_self_link = (
      var.encryption != null ? var.encryption.kms_key_self_link : null
    )

dynamic  "initialize_params" {
  for_each = (
        var.boot_disk.initialize_params == null
        ||
        var.boot_disk.use_independent_disk
        ? []
        : [""]
      )
      content {
  image                 = var.boot_disk.initialize_params.image
        size                  = var.boot_disk.initialize_params.size
        type                  = var.boot_disk.initialize_params.type
}
    }
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
}