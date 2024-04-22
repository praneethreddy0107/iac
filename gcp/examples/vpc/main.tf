module "vpc" {
  source                                 = "../../modules/vpc"
  vpc_create=true
  network_name                           = "test-vpc1"
  project_id                             = "test"
  auto_create_subnetworks                = false
  mtu                                    = 1400
  delete_default_internet_gateway_routes = false
  subnets = [
        {
            subnet_name           = "subnet-01"
            subnet_ip             = "10.10.10.0/24"
            subnet_region         = "us-west1"
        },
        {
            subnet_name           = "subnet-02"
            subnet_ip             = "10.10.20.0/24"
            subnet_region         = "us-west1"
            subnet_private_access = "false"
            description           = "This subnet has a description"
            purpose               = "PRIVATE_NAT"
            role                  = "ACTIVE"
        },
        {
            subnet_name                  = "subnet-03"
            subnet_ip                    = "10.10.30.0/24"
            subnet_region                = "us-west1"
            flow_logs_config             = { 
              aggregation_interval    = "INTERVAL_10_MIN"
              flow_sampling    = 0.7
              metadata    = "INCLUDE_ALL_METADATA"
              filter_expression = "true"
              }
           
        }
    ]

    secondary_ranges = {
        subnet-01 = [
            {
                range_name    = "subnet-01-secondary-01"
                ip_cidr_range = "192.168.64.0/24"
            },
        ]

        subnet-02 = []
    }
  routes = [
        {
            name                   = "egress-internet"
            description            = "route through IGW to access internet"
            destination_range      = "0.0.0.0/0"
            tags                   = "egress-inet"
            next_hop_internet      = "true"
        }
    ]

}