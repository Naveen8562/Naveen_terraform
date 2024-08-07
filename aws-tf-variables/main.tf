terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.61.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}

resource "aws_instance" "myinstancename" {
    ami = "ami-04a81a99f5ec58529"
    instance_type = var.aws_instance

    tags = {
        Name = "My_varible_instance"
    }
  
}