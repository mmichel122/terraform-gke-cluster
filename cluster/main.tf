
resource "google_container_cluster" "primary" {
  name       = var.cluster_name
  location   = "europe-west2"
  network    = var.network_vpc
  subnetwork = var.subnetwork

  #remove_default_node_pool = true
  initial_node_count = 2
}

/*
resource "google_container_node_pool" "primary_nodes" {
  name       = "nodes"
  location   = "europe-west2"
  cluster    = "${google_container_cluster.primary.name}"
  node_count = 2

  node_config {
    machine_type = "g1-small"
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
*/
