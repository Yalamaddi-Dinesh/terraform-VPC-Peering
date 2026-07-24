resource "aws_vpc_peering_connection" "peer" {
  vpc_id        = aws_vpc.VPC01.id
  peer_vpc_id   = aws_vpc.VPC02.id
  auto_accept   = true
   tags = {
    Name = "peer connection between vpc01 and vpc02"
   }
}

