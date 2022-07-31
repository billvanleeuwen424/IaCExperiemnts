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
  shared_config_files = ["../awscredentials"]
  region              = "us-east-1"
}

resource "aws_eip" "lb" {
  vpc = true
  tags = {
    Name = "gitlab-server-eip"
  }
}