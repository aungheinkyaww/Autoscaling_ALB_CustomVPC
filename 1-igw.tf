# Define IGW
resource "aws_internet_gateway" "customvpc-gw" {
  vpc_id = aws_vpc.customvpc.id

  tags = {
    Name = "customvpc-gw"
  }
}