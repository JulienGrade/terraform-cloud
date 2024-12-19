terraform {
  cloud {
    organization = "infra-learning"

    workspaces {
      name = "s3-bucket-example"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  required_version = ">= 1.4.0"
}

provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  endpoints {
    s3 = "http://localhost:4566"
  }
}

resource "aws_s3_bucket" "example" {
  bucket        = "my-terraform-cloud-bucket"
  force_destroy = true

  tags = {
    Name        = "Terraform Cloud Bucket"
    Environment = "Dev"
  }
}
