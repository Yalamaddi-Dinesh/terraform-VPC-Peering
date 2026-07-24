#igw01 for vpc 01
resource "aws_internet_gateway" "igw01" {
  vpc_id = aws_vpc.VPC01.id
   tags = {
    Name = "igw01"
   }
}

#igw02 for vpc 02
resource "aws_internet_gateway" "igw02" {
  vpc_id = aws_vpc.VPC02.id
   tags = {
    Name = "igw02"
   }
}
