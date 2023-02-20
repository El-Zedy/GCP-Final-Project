resource "google_container_cluster" "privatecluster"{
  name     = var.cluster_name
  network = google_compute_network.vpc_network.name
  subnetwork = google_compute_subnetwork.subnets[1].name

  remove_default_node_pool = true
  initial_node_count       = 2
  master_authorized_networks_config {
    cidr_blocks {
        cidr_block = var.cidr_ranges[0]
        display_name = var.subnet_names[0]
    }
  }
  private_cluster_config {
    enable_private_nodes = true
    enable_private_endpoint = true
    master_ipv4_cidr_block = var.master_ipv4_cidr_block
  }
   ip_allocation_policy {
  }
}

resource "google_container_node_pool" "privatecluster-node-pool" {
  name       = var.nodepool_name
  cluster    = google_container_cluster.privatecluster.name
  node_count = 2
 
  node_config {
    preemptible  = true
    machine_type = var.workern_type
    disk_type    = var.workern_disktype
    disk_size_gb = var.workern_disksize
    image_type   = var.workern_imagetype
    service_account = google_service_account.sa[0].email
    oauth_scopes    = var.workern_oauthscopes
  }
}