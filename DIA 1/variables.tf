##### General CONFIGS #####

variable "project_name" {
  type        = string
  description = "Nome do projeto"
}

variable "region" {
  type        = string
  description = "Região AWS onde os recursos serão criados"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR para a VPC"
  }


variable "private_subnet_cidrs" {
  type        = list(string)
  description = "CIDRs para as subnets privadas"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "CIDRs para as subnets públicas"
}

variable "database_subnet_cidrs" {
  type        = list(string)
  description = "CIDR para as subnets de banco de dados"
}

variable "availability_zones" {
  type        = list(string)
  description = "Lista de zonas de disponibilidade "
}

variable "enable_dns_support" {
  description = "DNS support do VPC"
  type        = bool
}

variable "enable_dns_hostnames" {
  description = "DNS hostnames do VPC"
  type        = bool
}