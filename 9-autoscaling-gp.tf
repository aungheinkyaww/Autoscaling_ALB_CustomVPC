# Create Auto Scaling Group
resource "aws_autoscaling_group" "custom-asg" {
  name                 = "custom-asg"
  desired_capacity     = 2
  max_size             = 4
  min_size             = 1
  force_delete         = true
  depends_on           = [aws_lb.custom-alb]
  target_group_arns    = ["${aws_lb_target_group.TG-tf.arn}"]
  health_check_type    = "EC2"
  launch_configuration = aws_launch_configuration.webserver-launch-config.name
  vpc_zone_identifier  = ["${aws_subnet.customvpc-private-1.id}", "${aws_subnet.customvpc-private-2.id}"]

  tag {
    key                 = "Name"
    value               = "custom-asg"
    propagate_at_launch = true
  }
}

# Create Target group

resource "aws_lb_target_group" "TG-tf" {
  name       = "Demo-TargetGroup-tf"
  depends_on = [aws_vpc.customvpc]
  port       = 80
  protocol   = "HTTP"
  vpc_id     = aws_vpc.customvpc.id
  health_check {
    interval            = 30
   # path                = "/index.html"
    port                = 80
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 15
    protocol            = "HTTP"
    matcher             = "200,202"
  }
}
