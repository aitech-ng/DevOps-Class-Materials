# Jenkins Installation and Configuration Guide

This guide provides instructions for installing Jenkins on Ubuntu and configuring it for use with GitHub or GitLab.

## Install Jenkins on Ubuntu

Follow these steps to install Jenkins on an Ubuntu machine:

```bash
# Update package index
sudo apt update

# Download the Jenkins package key
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian/jenkins.io-2023.key

# Add Jenkins repository to sources list
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian binary/" | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null 

# Install Java
sudo apt install fontconfig openjdk-17-jre -y

# Update package index again
sudo apt update 

# Install Jenkins
sudo apt install jenkins -y

# Enable and start Jenkins service
sudo systemctl enable jenkins
sudo systemctl start jenkins
```