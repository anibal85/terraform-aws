provider "aws" {
  access_key = ""
  secret_key = ""
  region     = "us-east-1"
}

## Create VPC ##
resource "aws_vpc" "terraform-vpc" {
  cidr_block           = "172.16.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = "terraform-demo-vpc"
  }
}

output "aws_vpc_id" {
  value = aws_vpc.terraform-vpc.id
}


## Create Subnets ##
resource "aws_subnet" "terraform-subnet_1" {
  vpc_id            = aws_vpc.terraform-vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "terraform-subnet_1"
  }
}

output "aws_subnet_subnet_1" {
  value = aws_subnet.terraform-subnet_1.id
}

## Create Subnets 2 ##
resource "aws_subnet" "terraform-subnet_2" {
  vpc_id            = aws_vpc.terraform-vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "terraform-subnet_2"
  }
}

output "aws_subnet_subnet_2" {
  value = aws_subnet.terraform-subnet_2.id
}
