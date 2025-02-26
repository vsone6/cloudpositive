resource "google_compute_instance" "vm_instance" {
  name         = "${var.instance_name}-${count.index}"
  machine_type = var.machine_type
  zone         = var.zone
  count = 5

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network = var.network
    access_config {
      # Assigns an external IP
    }
  }
}
