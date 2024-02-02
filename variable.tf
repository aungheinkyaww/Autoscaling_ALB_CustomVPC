variable "AWS_REGION" {
    default = "ap-southeast-1"
    description = "Default Singapore Region"
}

variable "AMI" {
  type    = string
  default = "ami-0fa377108253bf620" # Linux 22.04
}

variable "key_name" {
    default = "ahk-80xg"
}

variable "instance_type" {
    default = "t2.micro"
  
}

