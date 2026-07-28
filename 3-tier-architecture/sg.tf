#######################Security Group for ALB
resource "aws_security_group" "alb_sg" {
  name        = "alb-sg"
  description = "Allow HTTP and HTTPS inbound traffic"
  vpc_id      = aws_vpc.my_vpc.id # Replace with your VPC ID

  ingress {
    description = "HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS from anywhere"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "albsg"
  }
}

#######################security group for bastion host
resource "aws_security_group" "bastion_sg" {
  name        = "allow-ssh-sg"
  description = "Security group for SSH access"
  vpc_id      = aws_vpc.my_vpc.id # Replace with your VPC ID
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4" {
  security_group_id = aws_security_group.bastion_sg.id
  
  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "******************"
}

##############security group for web servers###########################3
resource "aws_security_group" "web_sg" {
  name        = "web-server-sg"
  description = "Security group for web servers"
  vpc_id      = aws_vpc.my_vpc.id # Replace with your VPC ID
}

# Allow HTTP (port 80) from ALB Security Group
resource "aws_security_group_rule" "allow_alb_http" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = aws_security_group.web_sg.id
  source_security_group_id = aws_security_group.alb_sg.id
  description              = "Allow port 80 from ALB"
}

# Allow SSH (port 22) from Bastion Security Group
resource "aws_security_group_rule" "allow_bastion_ssh" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = aws_security_group.web_sg.id
  source_security_group_id = aws_security_group.bastion_sg.id
  description              = "Allow port 22 from Bastion"
}

###############security group for app servers###########################3
resource "aws_security_group" "app_sg" {
  name        = "app-server-sg"
  description = "Security group for application server"
  vpc_id      = aws_vpc.my_vpc.id 
}

resource "aws_security_group_rule" "allow_web_8080" {
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = aws_security_group.app_sg.id
  source_security_group_id = aws_security_group.web_sg.id
  description              = "Allow port 8080 from web security group"
}

resource "aws_security_group_rule" "allow_bastion_22" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = aws_security_group.app_sg.id
  source_security_group_id = aws_security_group.bastion_sg.id
  description              = "Allow port 22 from bastion security group"
}


################security group for db servers###########################
# The target security group you are adding rules to
resource "aws_security_group" "db_sg" {
  name        = "db-server-sg"
  description = "Security group for database server"
  vpc_id      = aws_vpc.my_vpc.id # Replace with your VPC ID
}

# Allow inbound port 3306 (MySQL) from App SG
resource "aws_security_group_rule" "allow_mysql_from_app" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  security_group_id        = aws_security_group.db_sg.id
  source_security_group_id = aws_security_group.app_sg.id
  description              = "Allow MySQL from App SG"
}

# Allow inbound port 22 (SSH) from Bastion SG
resource "aws_security_group_rule" "allow_ssh_from_bastion" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = aws_security_group.db_sg.id
  source_security_group_id = aws_security_group.bastion_sg.id
  description              = "Allow SSH from Bastion SG"
}


