terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.61.0"
    }
  }
  backend "s3" {
    bucket = "mybucket-naveen8562-174e191b9b6848ca"
    key = "backend.tfstate"
    region = "us-east-1"
    
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}

resource "aws_instance" "MyInstance" {
    ami = "ami-04a81a99f5ec58529"
    instance_type = "t2.micro"

    tags = {
        Name ="My_Server"
    }
  
}