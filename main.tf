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
  region = "eu-west-2"
}

resource "aws_instance" "my_server" {
  ami           = "ami-07c1b39b7b3d2525d"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}
