terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  credentials = file("creds/nyt-mbcompdev-dev-9728dd97d09d.json")
  project     = "nyt-mbcompdev-dev"
  region      = "us-east1"
  zone        = "us-east1-b"
}
# create a VPC network
resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}
# create a VM instance, using the VPC network as the background
resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"
  tags = ["web","dev"]
  boot_disk {
    initialize_params {
      image = "cos-cloud/cos-stable"
    }
  }
  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {}
  }
}

