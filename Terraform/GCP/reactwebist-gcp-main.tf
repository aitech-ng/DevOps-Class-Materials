resource "google_compute_firewall" "web-react" {
  name    = "allow-http-ssh-react"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["80", "22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["react-server"]
}

resource "google_compute_instance" "react-web" {
  name         = "react-web-server"
  machine_type = "n2-standard-2"
  zone         = "us-central1-c"
  tags         = ["react-server"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
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
    apt-get install -y curl git

    # Install Node.js
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
    apt-get install -y nodejs

    # Install Nginx
    apt-get install -y nginx

    # Clone the React Project
    git clone https://github.com/GerromeSieger/React-Site.git /tmp/React-Site
    cd /tmp/React-Site

    # Install Dependencies and Build the Project
    npm install
    npm run build

    # Deploy the Built Site
    rm -rf /var/www/html/*
    cp -r build/* /var/www/html/

    # Set correct permissions
    chown -R www-data:www-data /var/www/html
    chmod -R 755 /var/www/html

    # Configure Nginx to serve React app
    cat > /etc/nginx/sites-available/default <<EOL
    server {
        listen 80 default_server;
        listen [::]:80 default_server;
        root /var/www/html;
        index index.html index.htm;
        server_name _;
        location / {
            try_files \$uri \$uri/ /index.html;
        }
    }
    EOL

    # Restart Nginx
    systemctl restart nginx

    echo "React site deployment completed."
  EOF

  service_account {
    email  = google_service_account.default.email
    scopes = ["cloud-platform"]
  }
}

output "instance_react_external_ip" {
  description = "The external IP address of the React instance"
  value       = google_compute_instance.react-web.network_interface[0].access_config[0].nat_ip
}