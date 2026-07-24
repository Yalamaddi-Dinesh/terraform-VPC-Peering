resource "aws_vpc" "VPC01" {
  cidr_block = var.ipaddress
  tags = {
    Name = "VPC01"
  }
}


resource "aws_vpc" "VPC02" {
  cidr_block = var.ipaddress01
  tags = {
    Name = "VPC02"
  }
}
