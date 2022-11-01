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


  source_tags = ["web"]
  
}
//for_vpc_network
resource "google_compute_network" "default" {
  name = "test-network"
}
