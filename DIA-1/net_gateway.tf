resource "aws_eip" "vpc_eip" {
  count  = length(var.availability_zones)
  domain = "vpc"

  tags = {
    Name = "${var.project_name}-eip-${var.region}${var.availability_zones[count.index]}"
  }
}

##
## Se var.project_name for "myproject" e estamos no primeiro item do loop (count.index = 0), onde var.availability_zones[0] é "a", o resultado será:
## "myproject-eip-1a"
##

resource "aws_nat_gateway" "nat" {
  count         = length(var.availability_zones)
  allocation_id = aws_eip.vpc_eip[count.index].id
  subnet_id     = aws_subnet.private_subnets[count.index].id

  tags = {
    Name = "${var.project_name}-nat-${var.region}${var.availability_zones[count.index]}"
  }
}