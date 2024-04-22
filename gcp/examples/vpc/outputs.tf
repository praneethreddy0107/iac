

output "network" {
  value       = module.vpc.network
  description = "The VPC resource being created"
}

output "network_name" {
  value       = module.vpc.network.name
  description = "The name of the VPC being created"
}

output "network_id" {
  value       = module.vpc.network.id
  description = "The ID of the VPC being created"
}

output "network_self_link" {
  value       = module.vpc.network.self_link
  description = "The URI of the VPC being created"
}

output "subnets" {
  value       = module.vpc.subnets
  description = "The List of subnets being created"
}

output "routes" {
  value       = module.vpc.routes
  description = "The List of subnets being created"
}



