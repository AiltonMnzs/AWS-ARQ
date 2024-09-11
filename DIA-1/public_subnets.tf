resource "aws_subnet" "public_subnets" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet_cidrs[count.index]
  availability_zone = "${var.region}${var.availability_zones[count.index]}"

  tags = {
    Name = "${var.project_name}-public-subnet-${var.region}${var.availability_zones[count.index]}"

  }
}