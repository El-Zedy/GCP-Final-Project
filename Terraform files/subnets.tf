resource "google_compute_subnetwork" "subnets" {
  count         = length(var.cidr_ranges)
  name          = var.subnet_names[count.index]
  ip_cidr_range = var.cidr_ranges[count.index]
  network       = google_compute_network.vpc_network.id
}