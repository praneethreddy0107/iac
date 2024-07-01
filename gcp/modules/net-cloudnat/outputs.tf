output "id" {
  description = "Fully qualified NAT (router) id."
  value       = google_compute_router_nat.nat.id
}

output "name" {
  description = "Name of the Cloud NAT."
  value       = google_compute_router_nat.nat.name
}

output "nat_ip_allocate_option" {
  description = "NAT IP allocation mode."
  value       = google_compute_router_nat.nat.nat_ip_allocate_option
}

output "region" {
  description = "Cloud NAT region."
  value       = google_compute_router_nat.nat.region
}

output "router" {
  description = "Cloud NAT router resources (if auto created)."
  value = (
    var.router_create
    ? try(google_compute_router.router[0], null)
    : null
  )
}

output "router_name" {
  description = "Cloud NAT router name."
  value       = local.router_name
}