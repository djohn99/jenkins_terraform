provider "aws" {
  region = var.aws_region
}

terraform {
  required_version = ">= 0.13.0"
  required_providers {
    aws = ">= 3.18"
  }
}