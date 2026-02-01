variable "vpc_name" {
  description = "VPC Name"
  type=string
  default = "myvpc"
}

variable "vpc_cidr_block" {
  description = "VPC CIDR Block"
  type = string
  default = "10.0.0.0/16"
}

variable "vpc_availability_zones" {
  description = "VPC availability zones"
  type = list(string)
  default = [ "us_east-1a", "us-east-1b" ]
}

variable "vpc_public_subnets" {
  description = "VPC Public subnet"
  type = list(string)
  default = [ "10.0.101.0.24", "10.0.102.0/24" ]
}

variable "vpc_private_subnets" {
  description = "VPC Private subnet"
  type = list(string)
  default = [ "10.0.1.0/24", "10.0.2.0/24" ]
}

variable "vpc_database_subnets" {
  description = "VPC Database Subnet"
  type = list(string)
  default = [ "10.0.151.0/24", "10.0.152.0/24" ]
}

variable "vpc_create_database_subnet_group" {
  description = "VPC create database subnet group"
  type = bool
  default = true
}

variable "vpc_create_database_subnet_route_table" {
  description = "VPC create Database subnet Route Table"
  type = bool
  default = true
}

variable "vpc_enable_nat_gateway" {
  description = "Enable NAT gateways for private Subnets Outbound Communication"
  type = bool
  default = true
}

variable "vpc_single_nat_gateway" {
  description = "Enable only single NAT Gateway"
  type = bool
  default = true
}