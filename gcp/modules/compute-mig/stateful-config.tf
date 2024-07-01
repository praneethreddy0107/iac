


resource "google_compute_per_instance_config" "default" {
  for_each = local.is_regional ? {} : var.stateful_config
  project  = var.project_id
  zone     = var.location
  name     = each.key
  instance_group_manager = try(
    google_compute_instance_group_manager.default[0].name, null
  )
  minimal_action                   = each.value.minimal_action
  most_disruptive_allowed_action   = each.value.most_disruptive_action
  remove_instance_state_on_destroy = each.value.remove_state_on_destroy

  dynamic "preserved_state" {
    for_each = each.value.preserved_state == null ? [] : [""]
    content {
      metadata = each.value.preserved_state.metadata
      dynamic "disk" {
        for_each = (
          each.value.preserved_state.disks == null
          ? {}
          : each.value.preserved_state.disks
        )
        content {
          device_name = disk.key
          source      = disk.value.source
          delete_rule = (
            disk.value.delete_on_instance_deletion == true
            ? "ON_PERMANENT_INSTANCE_DELETION"
            : "NEVER"
          )
          mode = disk.value.read_only == true ? "READ_ONLY" : "READ_WRITE"
        }
      }
    }
  }
}

resource "google_compute_region_per_instance_config" "default" {
  for_each = local.is_regional ? var.stateful_config : {}
  project  = var.project_id
  region   = var.location
  name     = each.key
  region_instance_group_manager = try(
    google_compute_region_instance_group_manager.default[0].name, null
  )
  minimal_action                   = each.value.minimal_action
  most_disruptive_allowed_action   = each.value.most_disruptive_action
  remove_instance_state_on_destroy = each.value.remove_state_on_destroy

  dynamic "preserved_state" {
    for_each = each.value.preserved_state == null ? [] : [""]
    content {
      metadata = each.value.preserved_state.metadata
      dynamic "disk" {
        for_each = (
          each.value.preserved_state.disks == null
          ? {}
          : each.value.preserved_state.disks
        )
        content {
          device_name = disk.key
          source      = disk.value.source
          delete_rule = (
            disk.value.delete_on_instance_deletion == true
            ? "ON_PERMANENT_INSTANCE_DELETION"
            : "NEVER"
          )
          mode = disk.value.read_only == true ? "READ_ONLY" : "READ_WRITE"
        }
      }
    }
  }
}