
output "external_ip" {
  description = "Instance main interface external IP addresses."
  value = (
    var.network_interfaces[0].nat
    ? try(google_compute_instance.instance[0].network_interface[0].access_config[0].nat_ip, null)
    : null
  )
}



output "id" {
  description = "Fully qualified instance id."
  value       = try(google_compute_instance.instance[0].id, null)
}

output "instance" {
  description = "Instance resource."
  sensitive   = true
  value       = try(google_compute_instance.instance[0], null)
}

output "internal_ip" {
  description = "Instance main interface internal IP address."
  value = try(
    google_compute_instance.instance[0].network_interface[0].network_ip,
    null
  )
}

output "internal_ips" {
  description = "Instance interfaces internal IP addresses."
  value = [
    for nic in try(google_compute_instance.instance[0].network_interface, [])
    : nic.network_ip
  ]
}

output "self_link" {
  description = "Instance self links."
  value       = try(google_compute_instance.instance[0].self_link, null)
}

