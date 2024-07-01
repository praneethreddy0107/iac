

output "autoscaler" {
  description = "Auto-created autoscaler resource."
  value = var.autoscaler_config == null ? null : try(
    google_compute_autoscaler.default[0],
    google_compute_region_autoscaler.default[0],
    {}
  )
}

output "group_manager" {
  description = "Instance group resource."
  value = try(
    google_compute_instance_group_manager.default[0],
    google_compute_region_instance_group_manager.default[0],
    {}
  )
}

output "health_check" {
  description = "Auto-created health-check resource."
  value = (
    var.health_check_config == null
    ? null
    : google_compute_health_check.default[0]
  )
}

output "id" {
  description = "Fully qualified group manager id."
  value = try(
    google_compute_instance_group_manager.default[0].id,
    google_compute_region_instance_group_manager.default[0].id,
    null
  )
}