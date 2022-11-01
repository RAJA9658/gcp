provider "google" {
  credentials = file("credential.json")
  project = "gold-subset-366105"
  region  = "asia-south1 (Mumbai)"
}


resource "google_compute_instance" "vm_instance" {
  count = 2
  name         = "terraform-instanc-${count.index + 1}"
  machine_type = "e2-micro"
   zone    = "asia-south1-a"
   service_account {
    email  = "access-terraform@gold-subset-366105.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-minimal-2204-lts"
    }
  }
   network_interface {

    network = google_compute_network.default.name
    access_config {
    }
  }
  metadata_startup_script = file("apache2.sh")
  
  

}

