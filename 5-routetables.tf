# Define routing association between a route table
resource "aws_route_table_association" "custtomvpc-public-1-a" {
  subnet_id      = aws_subnet.customvpc-public-1.id
  route_table_id = aws_route_table.customvpc-r.id
}

resource "aws_route_table_association" "custtomvpc-public-2-a" {
  subnet_id      = aws_subnet.customvpc-public-2.id
  route_table_id = aws_route_table.customvpc-r.id
}

# route association private-1
resource "aws_route_table_association" "custtomvpc-private-1" {
  subnet_id      = aws_subnet.customvpc-private-1.id
  route_table_id = aws_route_table.customvpc-private.id
}

# route association private-2
resource "aws_route_table_association" "custtomvpc-private-2" {
  subnet_id      = aws_subnet.customvpc-private-2.id
  route_table_id = aws_route_table.customvpc-private-2.id
}