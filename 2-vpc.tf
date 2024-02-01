resource "aws_vpc" "customvpc" {
  cidr_block       = "172.16.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "customvpc"
  }
}

# Define Routing table for custom VPC
resource "aws_route_table" "customvpc-r" {
  vpc_id = aws_vpc.customvpc.id

  route {
    cidr_block = "0.0.0.0/0" #all ips
    gateway_id = aws_internet_gateway.customvpc-gw.id
  }

  tags = {
    Name = "customvpc-public-r"
  }
}