resource "aws_subnet" "private_subnets" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.main.id  # Referência direta à VPC criada
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = "${var.region}${var.availability_zones[count.index]}"

  tags = {
    Name = "${var.project_name}-private-subnet-${var.region}${var.availability_zones[count.index]}"
  }
}