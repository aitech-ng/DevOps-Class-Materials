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

resource "aws_iam_group" "developers" {
  name = "developers"
}

resource "aws_iam_user" "Messi" {
  name = "Messi"
  force_destroy = true
}

resource "aws_iam_user" "Neymar" {
  name = "Neymar"
  force_destroy = true
}

resource "aws_iam_group_membership" "devs-membership" {
  name = "devs-membership"

  users = [
    aws_iam_user.Messi.name,
    aws_iam_user.Neymar.name,
  ]

  group = aws_iam_group.developers.name
}

output "password-messi" {
  value = aws_iam_user_login_profile.Messi-login.encrypted_password
}

output "password-Neymar" {
  value = aws_iam_user_login_profile.Neymar-login.encrypted_password
}

resource "aws_iam_group_policy" "developer-policy" {
  name  = "developer-policy"
  group = aws_iam_group.developers.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}
