terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.61.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}

#create a vpc

resource "aws_vpc" "my-vpc1" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "my_vpc1"
  }

}

#private subnet
resource "aws_subnet" "private-subnet" {
  cidr_block = "10.0.1.0/24"
  vpc_id     = aws_vpc.my-vpc1.id
  tags = {
    Name = "private-subnet"
  }

}

#public subnet
resource "aws_subnet" "public-subnet" {
  cidr_block = "10.0.2.0/24"
  vpc_id     = aws_vpc.my-vpc1.id
  tags = {
    Name = "public-subnet"
  }

}

#Internet gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my-vpc1.id
  tags = {
    Name = "my-igw"
  }
}

#route table

resource "aws_route_table" "my-rt" {
  vpc_id = aws_vpc.my-vpc1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    Name = "my-vpc-rt"
  }

}

resource "aws_route_table_association" "public-subnet" {
  route_table_id = aws_route_table.my-rt.id
  subnet_id      = aws_subnet.public-subnet.id

}


resource "aws_instance" "my-server" {
    ami = "ami-04a81a99f5ec58529"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.public-subnet.id

    tags = {

        Name = "My-Ec2-on-VPC"
    }
    
  
}

