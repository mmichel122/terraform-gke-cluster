provider "google" {
  credentials = "${file("./creds/serviceaccount.json")}"
  project     = var.project_id
  region      = "europe-west2"
}

module "network" {
  source       = "./network"
  project_name = var.project_name
  cidr_block   = var.cidr_block
}

module "cluster" {
  source       = "./cluster"
  project_name = var.project_name
  cluster_name = var.cluster_name
  network_vpc  = module.network.network_vpc_uri
  subnetwork   = module.network.subnetwork_link
}
