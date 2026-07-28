# Create the Application Load Balancer in public subnets
resource "aws_lb" "main" {
  name               = "icici-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [aws_subnet.public_subnet.id, aws_subnet.web_subnet.id] # Replace with your public subnet IDs
  tags = {
    Environment = "production"
  }
}

# Create the Target Group on port 80
resource "aws_lb_target_group" "web_tg" {
  name        = "icici-web-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.my_vpc.id
  target_type = "instance"
}

# Register icici-web-01 (webinstance) to the target group
resource "aws_lb_target_group_attachment" "web_attachment" {
  target_group_arn = aws_lb_target_group.web_tg.arn
  target_id        = aws_instance.web_server.id
  port             = 80
}

# Forward traffic from ALB listener to the Target Group
resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.main.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_tg.arn
  }
}
