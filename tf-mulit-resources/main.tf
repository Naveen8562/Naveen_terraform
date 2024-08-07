terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.61.0"
    }
  }
}

provider "aws" {
  region = var.region
  
}
locals {
   project = "my-project-01"
  
}

resource "aws_vpc" "my_vpc" {
    cidr_block = "10.0.0.0/16"
    #count = 2

    tags = {
      Name = "${local.project}-vpc"
    }
  
}

resource "aws_subnet" "main" {
    vpc_id = aws_vpc.my_vpc.id 
    cidr_block = "10.0.${count.index}.0/24"
    count = 2
    
        tags = {
      Name = "${local.project}-subnet-${count.index}"
    }
}

#Creating 4 ec-2 machines

resource "aws_instance" "main" {
  ami = "ami-0ba9883b710b05ac6"
  instance_type = "t2.micro"
  count = 4
  subnet_id = element(aws_subnet.main[*].id, count.index)
      tags = {
        Name = "${local.project}-instance-${count.index}"
      }
}