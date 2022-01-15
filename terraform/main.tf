terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  credentials = file("/media/sf_linnotes/devops/zippy-haiku-333019-4274b5f396e4.json")

  project = "zippy-haiku-333019"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_instance" "vm_instance" {
  name = "terraform-instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
}
network_interface {
    network = "default"
    access_config {
  }
}
}
