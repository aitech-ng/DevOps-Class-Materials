# Install terraform on linux, windows and mac os

## Linux

Install the HarshiCorp GPG Key

```bash
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint

# Add the official HashiCorp repository to your system

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list

# Update and install terraform

sudo apt update
sudo apt install terraform -y
```

## Windows (GUI)

1. Download the latest release: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli


2. Add kubectl to your Environment Variable PATH.


## Mac (GUI)

1. Download the latest release: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli