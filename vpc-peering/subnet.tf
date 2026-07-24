#subnet 01 for vpc 01
resource "aws_subnet" "subnet01" {
  vpc_id = aws_vpc.VPC01.id
  cidr_block = var.subnet01
}

#subnet 02 for vpc 02
resource "aws_subnet" "subnet02" {
  vpc_id = aws_vpc.VPC02.id
  cidr_block = var.subnet02
}