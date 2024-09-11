output "ssm_parameter_vpc_id_name" {
  value       = aws_ssm_parameter.vpc.name
}

output "ssm_parameter_private_subnet_name" {
  value       = aws_ssm_parameter.private_subnets[*].name
}

output "ssm_parameter_public_subnet_name" {
  value       = aws_ssm_parameter.public_subnets[*].name
}

output "ssm_parameter_database_subnet_name" {
  value       = aws_ssm_parameter.database_subnets[*].name
}