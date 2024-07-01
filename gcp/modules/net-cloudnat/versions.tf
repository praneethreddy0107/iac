terraform {
  required_version = ">= 1.7.4"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.25.0, < 6.0.0" # tftest
    }
   
  }
}