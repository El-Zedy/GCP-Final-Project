provider "google" {
  credentials = file("/home/mozoz/Desktop/ITI/GCP/keys.json")

  project = var.project_id
  region  = var.region
  zone    = var.zone 
}
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.51.0"
    }
  }
}