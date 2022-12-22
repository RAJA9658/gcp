resource "google_container_cluster" "primary" {
  name     = "my-gke-cluster"
  location = "asia-south1-a"
 network = google_compute_network.default.name
  subnetwork = google_compute_subnetwork.default.name

  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "my-node-pool"
  location   = "asia-south1-a"
  # version = "1.24.5-gke.600"
  cluster    = google_container_cluster.primary.name
  node_count = 1
   autoscaling {
           max_node_count       = 3 
           min_node_count       = 1 
           total_max_node_count = 0 
           total_min_node_count = 0 
        }

  node_config {
    preemptible  = true
    machine_type = "e2-small"
   

    

    service_account = "my-service@sonorous-charge-366012.iam.gserviceaccount.com"
    oauth_scopes    = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}
