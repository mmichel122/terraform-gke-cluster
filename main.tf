provider "google" {
  credentials = "${file("./creds/serviceaccount.json")}"
  project     = var.project_id
  region      = var.location
}

module "network" {
  source       = "./network"
  project_name = var.project_name
  cidr_block   = var.cidr_block
  network_name = var.network_name
}

module "cluster" {
  source       = "./cluster"
  project_name = var.project_name
  cluster_name = var.cluster_name
  network_vpc  = module.network.network_vpc_uri
  subnetwork   = module.network.subnetwork_link
  location     = var.location
}

module "filestore" {
  source       = "./file"
  region       = var.location
  file_name    = var.cluster_name
  network_name = module.network.vpc_name
}
