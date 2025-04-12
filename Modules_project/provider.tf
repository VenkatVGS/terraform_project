terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
    backend "remote" {
    hostname = "venkatesh0608.scalr.io"
    organization = "venkatesh0608"

    workspaces {
      name = "modules"
    }
  }
}



# Configure the AWS Provider
provider "aws" {
  region = var.aws_region_output
}