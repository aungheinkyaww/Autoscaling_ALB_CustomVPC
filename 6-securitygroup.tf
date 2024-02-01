
#security group form AWS ELB
resource "aws_security_group" "custom-elb-sg" {
  vpc_id = aws_vpc.customvpc.id
  description = "custom-elb-sg-allow-ssh-and-http"

  ingress {
    from_port   = 80
    to_port     = 80
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
    Name = "custom-elb-sg"
  }

}

#security group for instances
resource "aws_security_group" "custom-instance-sg" {
    vpc_id = aws_vpc.customvpc.id
    description = "security group for instances"

    ingress {
    from_port   = 22
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.custom-elb-sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    Name = "custom-elb-sg"
  }

}

