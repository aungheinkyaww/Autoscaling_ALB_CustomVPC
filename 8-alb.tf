# Create ALB

resource "aws_lb" "custom-alb" {
  name               = "custom-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.custom-elb-sg.id]
  subnets            = [aws_subnet.customvpc-public-1.id,aws_subnet.customvpc-public-2.id]

  tags = {
    name    = "custom-alb"
  }
}

# Create ALB Listener 

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.custom-alb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.TG-tf.arn
  }
}

