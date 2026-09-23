terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  #backend "s3" {
  #  bucket  = "devops-tfstate"
  #  key     = "dev/terraform.tfstate"
  #  region  = "ap-southeast-1"
  #  encrypt = true
  #}
}

provider "aws" {
  region = var.aws_region
}
