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

resource "aws_s3_bucket" "aitech_test_bucket_prod" {
  bucket_prefix = "aitech-test-bucket-prod"
  force_destroy = true
}

data "aws_iam_policy_document" "read_only_policy" {
  statement {
    actions = ["s3:GetObject", "s3:ListBucket"]
    resources = ["arn:aws:s3:::aitech-test-bucket-prod/*"]
    principals {
      identifiers = ["*"]
      type        = "AWS"
    }
  }
}

resource "aws_s3_bucket_policy" "terraform_state_policy" {
  bucket = aws_s3_bucket.aitech_test_bucket_prod.id
  policy = data.aws_iam_policy_document.read_only_policy.json
}

resource "aws_s3_bucket_versioning" "bucket-versioning" {
  bucket = aws_s3_bucket.aitech_test_bucket_prod.id
  versioning_configuration {
    status = "Enabled"
  }
}