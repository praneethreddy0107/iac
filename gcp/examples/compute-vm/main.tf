module "compute-vm"{
    source="../../modules/compute-vm"
   name="praneeth-vm" 
   project_id=var.project
   
zone="asia-south1-a"
instance_type = "e2-small"
network_interfaces = [{
  network    = "default"
  subnetwork = "default"
}]
    }