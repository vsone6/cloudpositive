resource "google_compute_instance" "vm_instance" {
    for_each = var.instance_config
    name="instance-${each.key}"
    machine_type=each.value
    zone=var.zone
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