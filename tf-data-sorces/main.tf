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
data "aws_ami" "ubuntu" {
  most_recent = true
    owners = ["amazon"]
  
}
output "aws_ami" {
  
  value = data.aws_ami.ubuntu
}



resource "aws_instance" "My-datasource" {
    ami = " ami-04a81a99f5ec58529 "
    instance_type = "t2.micro"

    tags = {
      Name = "Mydatasorce_instance"
    }
  
}

output "aws_ami" {
  value = data.aws_ami.ubuntu.id
  
}