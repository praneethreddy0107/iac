# Terraform end-to-end blueprints for Google Cloud

This section provides **[networking blueprints](./networking/)** that implement core patterns or features, **[data solutions blueprints](./data-solutions/)** that demonstrate how to integrate data services in complete scenarios, **[cloud operations blueprints](./cloud-operations/)** that leverage specific products to meet specific operational needs, **[GKE](./gke/)** and **[Serverless](./serverless/)** blueprints, and **[factories](./factories/)** that implement resource factories for the repetitive creation of specific resources.

Currently available blueprints:

- **apigee** - [Apigee X foundations](./apigee/apigee-x-foundations/). [Apigee Hybrid on GKE](./apigee/hybrid-gke/), [Apigee X analytics in BigQuery](./apigee/bigquery-analytics), [Apigee network patterns](./apigee/network-patterns/)
- **cloud operations** - [Active Directory Federation Services](./cloud-operations/adfs), [Cloud Asset Inventory feeds for resource change tracking and remediation](./cloud-operations/asset-inventory-feed-remediation), [Fine-grained Cloud DNS IAM via Service Directory](./cloud-operations/dns-fine-grained-iam), [Cloud DNS & Shared VPC design](./cloud-operations/dns-shared-vpc), [Delegated Role Grants](./cloud-operations/iam-delegated-role-grants), [Network Quota Monitoring](./cloud-operations/network-quota-monitoring), [Managing on-prem service account keys by uploading public keys](./cloud-operations/onprem-sa-key-management), [Compute Image builder with Hashicorp Packer](./cloud-operations/packer-image-builder), [Packer example](./cloud-operations/packer-image-builder/packer), [Compute Engine quota monitoring](./cloud-operations/compute-quota-monitoring), [Scheduled Cloud Asset Inventory Export to Bigquery](./cloud-operations/scheduled-asset-inventory-export-bq), [Configuring workload identity federation with Terraform Cloud/Enterprise workflows](./cloud-operations/terraform-cloud-dynamic-credentials), [TCP healthcheck and restart for unmanaged GCE instances](./cloud-operations/unmanaged-instances-healthcheck), [Migrate for Compute Engine (v5) blueprints](./cloud-operations/vm-migration), [Configuring workload identity federation to access Google Cloud resources from apps running on Azure](./cloud-operations/workload-identity-federation)
- **data solutions** - [GCE and GCS CMEK via centralized Cloud KMS](./data-solutions/cmek-via-centralized-kms), [Cloud Composer version 2 private instance, supporting Shared VPC and external CMEK key](./data-solutions/composer-2), [Cloud SQL instance with multi-region read replicas](./data-solutions/cloudsql-multiregion), [Data Platform](./data-solutions/data-platform-foundations), [Minimal Data Platform](./data-solutions/data-platform-minimal), [Spinning up a foundation data pipeline on Google Cloud using Cloud Storage, Dataflow and BigQuery](./data-solutions/gcs-to-bq-with-least-privileges), [#SQL Server Always On Groups blueprint](./data-solutions/sqlserver-alwayson), [Data Playground](./data-solutions/data-playground), [MLOps with Vertex AI](./data-solutions/vertex-mlops), [Shielded Folder](./data-solutions/shielded-folder), [BigQuery ML and Vertex AI Pipeline](./data-solutions/bq-ml)
- **factories** - [Fabric resource factories](./factories)
- **GKE** - [Binary Authorization Pipeline Blueprint](./gke/binauthz), [Storage API](./gke/binauthz/image), [Multi-cluster mesh on GKE (fleet API)](./gke/multi-cluster-mesh-gke-fleet-api), [GKE Multitenant Blueprint](./gke/multitenant-fleet), [Shared VPC with GKE support](./networking/shared-vpc-gke/), [GKE Autopilot](./gke/autopilot)
- **networking** - [Calling a private Cloud Function from On-premises](./networking/private-cloud-function-from-onprem), [HA VPN over Interconnect](./networking/ha-vpn-over-interconnect/), [GLB and multi-regional daisy-chaining through hybrid NEGs](./networking/glb-hybrid-neg-internal), [Hybrid connectivity to on-premise services through PSC](./networking/psc-hybrid), [HTTP Load Balancer with Cloud Armor](./networking/glb-and-armor), [Internal Load Balancer as Next Hop](./networking/ilb-next-hop), On-prem DNS and Google Private Access,  [PSC Producer](./networking/psc-hybrid/psc-producer), [PSC Consumer](./networking/psc-hybrid/psc-consumer), [Shared VPC with optional GKE cluster](./networking/shared-vpc-gke), [VPC Connectivity Lab](./networking/vpc-connectivity-lab/)
- **serverless** - [Cloud Run series](./serverless/cloud-run-explore)
- **third party solutions** - [OpenShift on GCP user-provisioned infrastructure](./third-party-solutions/openshift), [Wordpress deployment on Cloud Run](./third-party-solutions/wordpress/cloudrun)

For more information see the individual README files in each section.