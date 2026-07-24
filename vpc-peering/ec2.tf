resource "aws_instance" "instance01" {
  ami           = "ami-032cd1a6d943449a4"
  instance_type = "t3.micro"
  associate_public_ip_address = true
  subnet_id = aws_subnet.subnet01.id
  key_name = "icici-key"
  tags = {
    Name = "instance01"
  }
}