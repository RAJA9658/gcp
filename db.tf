provider "google" {
  credentials = file("credential.json")
  project = "gold-subset-366105"
  region  = "asia-south1 (Mumbai)"
 

}
resource "google_sql_database" "database" {
  name     = "my-database"
  instance = google_sql_database_instance.instance.name
}


resource "google_sql_database_instance" "instance" {
  name             = "my-sql"
  region           = "asia-south1"
  
  
  database_version = "MYSQL_8_0"
  settings {
    tier = "db-f1-micro"
    ip_configuration {
      ipv4_enabled = "true"
      authorized_networks {
        value = "0.0.0.0/0"
      }
       authorized_networks {
        value = "35.244.54.45"
      }
    }

  }

  deletion_protection  = "true"
 
 
}
resource "google_sql_user" "users" {
  name     = "rajat"
  instance = google_sql_database_instance.instance.name
  password = "12345"
}