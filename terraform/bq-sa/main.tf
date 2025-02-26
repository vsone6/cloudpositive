resource "google_service_account" "bq_service" {
  account_id = var.account_id  
  display_name = var.display_name
}
resource "google_bigquery_dataset_iam_member" "bq_dataset_access" {
  dataset_id =  var.dataset_id
  role       =  var.role
  member     = "serviceAccount:${google_service_account.bq_service.email}"
}
resource "google_compute_instance" "vm_instance" {
  name         = var.name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network = "default"
    access_config {}  
  }

  service_account {
    email  = google_service_account.bq_service.email
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}

