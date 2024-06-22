# Installing Docker & Docker Compose on Linux

This guide provides instructions for installing Docker and Docker Compose on Ubuntu and CentOS systems.

## Ubuntu Installation
Follow these steps to install Docker and Docker Compose on Ubuntu:

```bash
# Update package index
sudo apt update -y

# Install Docker
sudo apt install docker.io -y

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Make Docker Compose executable
sudo chmod +x /usr/local/bin/docker-compose

# Set permissions for Docker socket
sudo chmod 666 /var/run/docker.sock

# Start Docker service
sudo systemctl start docker

# Enable Docker to start on boot
sudo systemctl enable docker
```

### CentOS Installation
Follow these steps to install Docker and Docker Compose on CentOS:

```bash
# Update package index
sudo yum update -y

# Install required packages
sudo yum install -y yum-utils

# Add Docker repository
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# Install Docker and related tools
sudo yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# Start Docker service
sudo systemctl start docker

# Enable Docker to start on boot
sudo systemctl enable docker
```