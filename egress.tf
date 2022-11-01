resource "google_compute_firewall" "fw_ilb_ssh" {
  name          = "egress"
  direction     = "EGRESS"
  network       = google_compute_network.default.name
  log_config {
   metadata = "INCLUDE_ALL_METADATA"
 }

  allow {
    protocol = "tcp"
    ports = ["0-65535"]

   
  }
  target_tags   = ["allow-all"]
  source_ranges = ["0.0.0.0/0"]
}
