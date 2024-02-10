terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "master_node" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  key_name = "devkey"
  security_groups = [aws_security_group.instance_security_group.id]
  tags = {
    Name = "master-node"
  }
}

resource "aws_instance" "slave_node1" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  key_name = "devkey"
  security_groups = [aws_security_group.instance_security_group.id]
  tags = {
    Name = "slave-node1"
  }
}

resource "aws_instance" "slave_node2" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  key_name = "devkey"
  security_groups = [aws_security_group.instance_security_group.id]
  tags = {
    Name = "slave-node2"
  }
}

resource "aws_security_group" "instance_security_group" {
  name        = "instance_security"
  description = "Allow traffic on ports 22 and 80"
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}