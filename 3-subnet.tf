# Create Subnets in customvpc

resource "aws_subnet" "customvpc-public-1" {
  vpc_id     = aws_vpc.customvpc.id
  cidr_block = "172.16.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "ap-southeast-1b"

  tags = {
    Name = "customvpc-public-1"
  }
}

resource "aws_subnet" "customvpc-public-2" {
  vpc_id     = aws_vpc.customvpc.id
  cidr_block = "172.16.2.0/24"
  map_public_ip_on_launch = true
  availability_zone = "ap-southeast-1c"

  tags = {
    Name = "customvpc-public-2 "
  }
}

resource "aws_subnet" "customvpc-private-1" {
  vpc_id     = aws_vpc.customvpc.id 
  cidr_block = "172.16.3.0/24"
  map_public_ip_on_launch = false
  availability_zone = "ap-southeast-1b"

  tags = {
    Name = "customvpc-private-1"
  }
}

resource "aws_subnet" "customvpc-private-2" {
  vpc_id     = aws_vpc.customvpc.id
  cidr_block = "172.16.4.0/24"
  map_public_ip_on_launch = false
  availability_zone = "ap-southeast-1c"

  tags = {
    Name = "customvpc-private-2"
  }
}