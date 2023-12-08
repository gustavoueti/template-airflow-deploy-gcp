
######################################################
#Virtual Machine Instance
######################################################

resource "google_compute_instance" "default" {
  name         = var.vm_name
  machine_type = var.machine_type
  zone         = var.zone

  tags = ["airflow"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }

  network_interface {
    network = google_compute_network.vpc_terraform_network.self_link

    access_config {
      // Ephemeral public IP
    }
  }

  metadata_startup_script = "${file("../scripts/install_airflow_docker.sh")}"

}

resource "google_compute_network" "vpc_terraform_network" {
  name                    = "terraform-network"
  auto_create_subnetworks = "true"
}

resource "google_compute_firewall" "ssh-rule" {
  name    = "demo-ssh"
  network = google_compute_network.vpc_terraform_network.self_link
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
}
