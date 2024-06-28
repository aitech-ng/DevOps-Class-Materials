terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  project = "ken-cloud-427207"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_network" "vpc_network" {
  name                    = "terraform-network"
  auto_create_subnetworks = "true"
}

resource "google_compute_firewall" "web" {
  name    = "allow-http-ssh"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["80", "22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["web-server"]
}

resource "google_service_account" "default" {
  account_id   = "web-server-sa"
  display_name = "Web Server Service Account"
}

resource "google_compute_instance" "web_server" {
  name         = "web-server"
  machine_type = "n2-standard-2"
  zone         = "us-central1-c"
  tags         = ["web-server"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
      // Ephemeral public IP
    }
  }

  metadata_startup_script = <<-EOF
    #!/bin/bash
    set -e

    # Update System Packages
    apt-get update
    apt-get install -y nginx git

    # Clone the Website Code
    git clone https://github.com/GerromeSieger/Static-Site.git /tmp/Static-Site

    # Deploy the Website
    rm -rf /var/www/html/*
    cp -r /tmp/Static-Site/* /var/www/html/

    # Set correct permissions
    chown -R www-data:www-data /var/www/html
    chmod -R 755 /var/www/html

    # Restart Nginx
    systemctl restart nginx

    echo "Static website deployment completed."
  EOF

  service_account {
    email  = google_service_account.default.email
    scopes = ["cloud-platform"]
  }
}

output "instance_external_ip" {
  description = "The external IP address of the web server"
  value       = google_compute_instance.web_server.network_interface[0].access_config[0].nat_ip
}