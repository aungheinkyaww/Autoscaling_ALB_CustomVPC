# Define external IP - NAT Gateway - Use NAT Gateway for private VPC subnet

resource "aws_eip" "customvpc-nat" {
   domain   = "vpc"
}

resource "aws_eip" "customvpc-nat-2" {
   domain   = "vpc"
}

resource "aws_nat_gateway" "customvpc-nat-gw" {
  allocation_id = aws_eip.customvpc-nat.id
  subnet_id     = aws_subnet.customvpc-public-1.id
  depends_on = [aws_internet_gateway.customvpc-gw]
}

resource "aws_nat_gateway" "customvpc-nat-gw-2" {
  allocation_id = aws_eip.customvpc-nat-2.id
  subnet_id     = aws_subnet.customvpc-public-2.id
  depends_on = [aws_internet_gateway.customvpc-gw]
}


resource "aws_route_table" "customvpc-private" {
  vpc_id = aws_vpc.customvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.customvpc-nat-gw.id
  }
  tags = {
    Name = "customvpc-private"
  }
}

resource "aws_route_table" "customvpc-private-2" {
  vpc_id = aws_vpc.customvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.customvpc-nat-gw-2.id
  }
  tags = {
    Name = "customvpc-private-2"
  }
}