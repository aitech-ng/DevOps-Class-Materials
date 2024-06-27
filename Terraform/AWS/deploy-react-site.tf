terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "eu-north-1"
}

# Get default VPC details
data "aws_vpc" "default" {
  default = true
}

# Create a security group
resource "aws_security_group" "app_sg" {
  name        = "app-sg"
  description = "Security group for React app"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "app-sg"
  }
}

resource "aws_instance" "app" {
  ami                    = "ami-0705384c0b33c194c"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.app_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              
              # Deploy a React Site on Ubuntu 24 with Nginx

              # Exit immediately if a command exits with a non-zero status
              set -e

              # 1. Update System Packages
              echo "Updating system packages..."
              apt update

              # 2. Install Node.js
              echo "Installing Node.js..."
              curl -sL https://deb.nodesource.com/setup_18.x | bash -
              apt install nodejs -y

              # 3. Install Nginx
              echo "Installing Nginx..."
              apt install nginx -y

              # 4. Clone the React Project
              echo "Cloning the React project..."
              git clone https://github.com/GerromeSieger/React-Site.git
              cd React-Site

              # 5. Install Dependencies
              echo "Installing dependencies..."
              npm install

              # 6. Build the Project
              echo "Building the project..."
              npm run build

              # 7. Deploy the Built Site
              echo "Deploying the built site..."
              cp -r build/* /var/www/html

              # 8. Restart Nginx
              echo "Restarting Nginx..."
              systemctl restart nginx

              echo "Deployment completed. Your React site should now be live."
              EOF

  tags = {
    Name = "Aitech-terraform"
  }
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.app.public_ip
}

output "security_group_id" {
  description = "ID of the security group"
  value       = aws_security_group.app_sg.id
}

output "vpc_cidr" {
  description = "CIDR block of the VPC"
  value       = data.aws_vpc.default.cidr_block
}

output "vpc_id" {
  description = "ID of the VPC"
  value       = data.aws_vpc.default.id
}
