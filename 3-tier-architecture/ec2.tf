#bastion host instance
resource "aws_instance" "bastion_host" {
  ami                         = "ami-0f8a61b66d1accaee"
  instance_type               = "t3.micro"
  
  # References your existing resources
  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids      = [aws_security_group.bastion_sg.id]
  associate_public_ip_address = true 
  key_name                    = "temporary" 

  tags = {
    Name = "bastion-host"
  }
}

#web server instance
resource "aws_instance" "web_server" {
  ami                         = "ami-0f8a61b66d1accaee"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.web_subnet.id
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = false 
  tags = {
    Name = "web-server"
  }
}

#app server instance
resource "aws_instance" "app_server" {
  ami                         = "ami-0f8a61b66d1accaee"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.app_subnet.id
  vpc_security_group_ids      = [aws_security_group.app_sg.id]
  associate_public_ip_address = false 
  tags = {
    Name = "app-server"
  }
}

#db server instance
resource "aws_instance" "db_server" {
  ami                         = "ami-0f8a61b66d1accaee"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.db_subnet.id
  vpc_security_group_ids      = [aws_security_group.db_sg.id]
  associate_public_ip_address = false 
  tags = {
    Name = "db-server"
  }
}
