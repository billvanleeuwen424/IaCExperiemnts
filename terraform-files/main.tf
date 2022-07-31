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
  shared_config_files = ["awscredentials"]
  region              = "us-east-1"
}


resource "aws_instance" "app_server" {
  ami             = "ami-06640050dc3f556bb"
  instance_type   = "t2.large"
  security_groups = ["MyGroup"]
  tags = {
    Name = "Gitlab Server"
  }

  root_block_device {
    volume_size = 20
  }

  key_name = "AWS Key"
}

resource "aws_eip" "lb" {
  instance = aws_instance.app_server.id
  vpc      = true
}