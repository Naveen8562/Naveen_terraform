provider "aws" {
    region = "us-east-1"
  
}

data "aws_availability_zones" "name" {
    state = "available"

  
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.11.0"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

 azs = data.aws_availability_zones.name.names
#azs = ["us-east-1"]
    private_subnets = ["10.0.0.0/24",]

     
    public_subnets  = ["10.0.1.0/24"]
tags = {
            Name = "my-vpc-public-subnets"
        }
       

        
}
