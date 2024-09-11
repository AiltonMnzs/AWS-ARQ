
resource "aws_ssm_parameter" "vpc" {
  name  = "/${var.project_name}/vpc/vpc_id"
  type  = "String"
  value = aws_vpc.main.id
}

resource "aws_ssm_parameter" "private_subnets" {
  count = length(var.availability_zones)
  name  = "/${var.project_name}/vpc/subnet_private_${var.region}${var.availability_zones[count.index]}"
  type  = "String"
  value = aws_subnet.private_subnets[count.index].id
}

resource "aws_ssm_parameter" "public_subnets" {
  count = length(var.availability_zones)
  name  = "/${var.project_name}/vpc/subnet_public_${var.region}${var.availability_zones[count.index]}"
  type  = "String"
  value = aws_subnet.public_subnets[count.index].id
}

resource "aws_ssm_parameter" "database_subnets" {
  count = length(var.availability_zones)
  name  = "/${var.project_name}/vpc/subnet_databases_${var.region}${var.availability_zones[count.index]}"
  type  = "String"
  value = aws_subnet.databases_subnet[count.index].id
}