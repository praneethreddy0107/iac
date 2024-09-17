variable "bq_create" {
  default = true
  type    = bool
}


variable "dataset_id" {
  description = "Unique ID for the dataset being provisioned."
  type        = string
}

variable "dataset_name" {
  description = "Friendly name for the dataset being provisioned."
  type        = string
  default     = null
}

variable "description" {
  description = "Dataset description."
  type        = string
  default     = null
}

variable "location" {
  description = "The regional location for the dataset only US and EU are allowed in module"
  type        = string
  default     = "US"
}

variable "project_id" {
  default = "your-project-id" # Replace with your project ID
}

variable "datasets" {
  description = "A map of dataset configurations"
  type = map(object({
    dataset_id   = string
    dataset_name = string
    location     = string
  }))
  default = {
    dataset1 = {
      dataset_id   = "praneeth_dataset"
      dataset_name = "praneeth_dataset"
      location     = "US"
    }
    dataset2 = {
      dataset_id   = "praneeth_dataset2"
      dataset_name = "praneeth_dataset2"
      location     = "EU"
    }
    # Add more datasets as needed
  }
}
