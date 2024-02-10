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

resource "aws_s3_bucket" "aitech_test_bucket_dev" {
  bucket_prefix = "aitech-test-bucket-dev"
  force_destroy = true
}
