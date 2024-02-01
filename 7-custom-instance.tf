#Create Launch config

resource "aws_launch_configuration" "webserver-launch-config" {
  name_prefix     = "webserver-launch-config"
  image_id        = var.AMI
  instance_type   = "t2.micro"
  key_name        = var.key_name
  security_groups = ["${aws_security_group.custom-instance-sg.id}"]

  lifecycle {
    create_before_destroy = true
  }
  user_data = filebase64("${path.module}/userdata.sh")
}


# store the terraform state file in s3
terraform {
  backend "s3" {
    bucket = "ahk-terraform-state-file-bucket"
    key = "state/terraform.tfstate"
    region = "ap-southeast-1"
    profile = "terraform-user"
    
  }
}
