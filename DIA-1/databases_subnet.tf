resource "aws_subnet" "databases_subnet" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.database_subnet_cidrs[count.index]
  availability_zone = "${var.region}${var.availability_zones[count.index]}"

  tags = {
    Name = "${var.project_name}-databases-subnet-${var.region}${var.availability_zones[count.index]}"
  }
}