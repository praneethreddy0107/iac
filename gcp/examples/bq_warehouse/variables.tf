


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
variable "region" {
  type        = string
  description = "Google Cloud Region"

  /**
 * This variable list assumes you are using the same region for both Dataform and all other assets.
 * If you want to deploy your Dataform respositories in a different region, set the default value
 * for var.dataform_region to one of the regions in the Dataform validation list.
 * You can then set this variable value to any of the following:
 *     "asia-northeast3"
 *     "asia-southeast1"
 *     "europe-west1"
 *     "europe-west2"
 *     "europe-west3"
 *     "europe-west4"
 *     "europe-west9"
 *     "us-central1"
 *     "us-west4"
 *
 * Be sure to update the validation list below to include these additional values!
 */

  validation {
    condition = contains([
      "asia-southeast1",
      "europe-west1",
      "europe-west2",
      "europe-west3",
      "europe-west4",
      "us-central1",
      ],
    var.region)
    error_message = "This region is not supported. Region must be one of: asia-southeast1, europe-west1, europe-west2, europe-west3, europe-west4, us-central1"
  }
}


variable "dataform_region" {
  type        = string
  description = "Region that is used to deploy Dataform resources. This does not limit where resources can be run or what region data must be located in."
  default     = null
  nullable    = true

  validation {
    condition = anytrue([var.dataform_region == null, try(contains(
      [
        "asia-east1",
        "asia-northeast1",
        "asia-south1",
        "asia-southeast1",
        "australia-southeast1",
        "europe-west1",
        "europe-west2",
        "europe-west3",
        "europe-west4",
        "europe-west6",
        "southamerica-east1",
        "us-central1",
        "us-east1",
        "us-west1",
    ], var.dataform_region), true)])
    error_message = "This region is not supported for Dataform. Region must be one of: asia-east1, asia-northeast1, asia-south1, asia-southeast1, australia-southeast1, europe-west1, europe-west2, europe-west3, europe-west4, europe-west6, southamerica-east1, us-central1, us-east1, us-west1."
  }
}


variable "text_generation_model_name" {
  type        = string
  description = "Name of the BigQuery ML GenAI remote model that connects to the LLM used for text generation"
  default     = "text_generate_model"

}
variable "labels" {
  type        = map(string)
  description = "A map of labels to apply to contained resources."
  default     = { "data-warehouse" = true }
}

variable "enable_apis" {
  type        = string
  description = "Whether or not to enable underlying apis in this solution."
  default     = true
}

variable "force_destroy" {
  type        = string
  description = "Whether or not to protect BigQuery resources from deletion when solution is modified or changed."
  default     = true
}

variable "deletion_protection" {
  type        = string
  description = "Whether or not to protect GCS resources from deletion when solution is modified or changed."
  default     = false
}

variable "create_ignore_service_accounts" {
  type        = string
  description = "Whether or not to ignore creation of a service account if an account of the same name already exists"
  default     = true
}