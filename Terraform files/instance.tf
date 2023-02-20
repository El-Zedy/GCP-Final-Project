resource "google_compute_instance" "private_vm" {
  name         = var.vm_name
  machine_type = var.machine_type 
  zone         = var.zone
  tags         = ["private-vm"]

  boot_disk {
    initialize_params{
      image = var.vm_image
    }
  }
  scratch_disk {
    interface = "SCSI"
  }
  network_interface {
    network = google_compute_network.vpc_network.name
    subnetwork = google_compute_subnetwork.subnets[0].name
  }
  
  service_account {
    email  = google_service_account.sa[1].email
    scopes = ["cloud-platform"]
  }
}
