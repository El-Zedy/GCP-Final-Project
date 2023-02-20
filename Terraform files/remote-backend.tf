resource "google_storage_bucket" "remote-backend" {
  name          = var.bucket_name
  force_destroy = false
  location      = var.region 
  storage_class = var.bucket_class
  versioning {
    enabled = true
  }
}
terraform {
 backend "gcs" {
   bucket  = "backend-bucket-moelzedy"
   prefix  = "terraform/state"
 }
}