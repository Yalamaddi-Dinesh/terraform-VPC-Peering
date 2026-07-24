#route table for VPC01
resource "aws_default_route_table" "default-rt-01" {
  default_route_table_id = aws_vpc.VPC01.default_route_table_id
  route {
    cidr_block = var.any
    gateway_id = aws_internet_gateway.igw01.id
  }
 route {
    cidr_block = "10.1.0.0/16"
    vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
  } 
  tags = {
    Name = "default-rt-01"
  }
}


#route table for vpc02
resource "aws_default_route_table" "default-rt-02" {
  default_route_table_id = aws_vpc.VPC02.default_route_table_id
  route {
    cidr_block = var.any
    gateway_id = aws_internet_gateway.igw02.id
  }
 route {
    cidr_block = "10.0.0.0/16"
    vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
  }  
  tags = {
    Name = "default-rt-02"
  }
}