terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }

  backend "s3" {
    bucket         = "tfstate-975050193152"
    dynamodb_table = "tf-lock"
    key            = "main/terraform.tfstate"
    region         = "ap-southeast-1"
  }

  # backend "local" {}
}

provider "aws" {
  region = "ap-southeast-1"
}
