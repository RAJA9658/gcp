resource "google_compute_firewall" "default" {
  name    = "test-firewall"
  network = google_compute_network.default.name
  source_ranges = ["0.0.0.0/0"]
  priority      = 65534
 // enable_logging = "true"
 log_config {
   metadata = "INCLUDE_ALL_METADATA"
 }
 
  allow {
    protocol = "icmp"
  }

  allow { 
    protocol = "tcp"
    ports    = ["80", "8080"]
  }
  allow { 
    protocol = "tcp"
    ports    = ["22"]
  }


<<<<<<< HEAD
  source_tags = ["web"]
=======
  source_tags = ["web-anda-ssh"]
>>>>>>> e9d25d581483cb38c7ac0e7202adc7976b0e2bce
  
}
//for_vpc_network
resource "google_compute_network" "default" {
  name = "test-network"
}
