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
  # Configuration options
  region = var.region
}

resource "aws_s3_bucket" "mybucket" {
  bucket = "mybucket-naveen8562-${random_id.random_id.hex}"

}
resource "aws_s3_object" "bucket-data" {
  bucket = aws_s3_bucket.mybucket.bucket
  source = "./myfile.txt"
  key    = "mydata.txt"

}
resource "random_id" "random_id" {
    byte_length = 8
  
}
output "name" {
    value = random_id.random_id.hex
  
}