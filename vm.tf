provider "google" {
  credentials = file("credential.json")
  project = "gold-subset-366105"
  region  = "asia-south1 (Mumbai)"
}
<<<<<<< HEAD
/*resource "random_id" "instance_id" {
  byte_length = 8
}*/
=======
>>>>>>> 033392a5bcba80aa1af71f6ef50fd2a21fc573bd

resource "google_compute_instance" "vm_instance" {
  count = 2
  name         = "terraform-instance-${count.index + 1}"
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
<<<<<<< HEAD
=======
output "instance_ip"   {
  value =  google_compute_instance.vm_instance.network_interface.0.access_config.0.nat_ip
  
}
output "port_number" {
    value = ":8080"
}
output "waiting_time" {
   value = "is 4min to install and 2min to apply ip over the browser"

}
>>>>>>> 033392a5bcba80aa1af71f6ef50fd2a21fc573bd
