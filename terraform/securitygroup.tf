#security group for vpc01
resource "aws_default_security_group" "sg01" {
  vpc_id = aws_vpc.VPC01.id

  ingress {
    protocol    = "-1"
    self        = true        # Or use cidr_blocks = ["0.0.0.0/0"] for the whole internet
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



#security group for vpc02
resource "aws_default_security_group" "sg02" {
  vpc_id = aws_vpc.VPC02.id

  ingress {
    protocol    = "-1"
    self        = true        # Or use cidr_blocks = ["0.0.0.0/0"] for the whole internet
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}