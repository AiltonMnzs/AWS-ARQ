resource "aws_route_table" "private_internet_access" {
  count  = length(var.availability_zones)
  vpc_id = aws_vpc.main.id  

  tags = {
    Name = "${var.project_name}-private-${var.region}${var.availability_zones[count.index]}"
  }
}

resource "aws_route" "private_access" {
  count                  = length(var.availability_zones)
  route_table_id         = aws_route_table.private_internet_access[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat[count.index].id
}

resource "aws_route_table_association" "private" {
  count          = length(var.availability_zones)
  subnet_id      = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.private_internet_access[count.index].id
}