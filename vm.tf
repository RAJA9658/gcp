provider "google" {
  credentials = file("credential.json")
  project = "gold-subset-366105"
  region  = "asia-south1 (Mumbai)"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
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
output "instance_ip"   {
  value =  google_compute_instance.vm_instance.network_interface.0.access_config.0.nat_ip
  
}
output "port_number" {
    value = ":8080"
}
output "waiting_time" {
   value = "is 4min to install and 2min to apply ip over the browser"

}
