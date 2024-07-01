resource "google_compute_instance_group" "unmanaged" {
  count   = var.group != null && !var.create_template ? 1 : 0
  project = var.project_id
  network = (
    length(var.network_interfaces) > 0
    ? var.network_interfaces[0].network
    : ""
  )
  zone        = var.zone
  name        = var.name
  description = var.description
  instances   = [google_compute_instance.instance[0].self_link]
  dynamic "named_port" {
    for_each = var.group.named_ports != null ? var.group.named_ports : {}
    iterator = config
    content {
      name = config.key
      port = config.value
    }
  }
}