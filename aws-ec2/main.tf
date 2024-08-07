terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.61.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.6.2"
    }
  }
}

provider "aws" {
  # Configuration options working on the regtion below variable
  region = var.region
}
resource "random_id" "random_id" {
  byte_length = 8
}

resource "aws_instance" "myserver" {
  # Using the aws ubuntu server
  ami           = var.ami
  instance_type = "t2.micro"
  subnet_id  = aws_subnet.public.subnet.id

  tags = {
    Name = "SampleServer-${random_id.random_id.hex}"
  }
}