variable "project_name" {
  description = "Name of the project"
  type = string
}

variable "environment" {
  description = "Environment Name"
  type = string
}

variable "aws_region" {
  description = "AWS Region"
  type = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for public subnet"
  type = string
  default = "10.0.0.0/24"
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type = list(string)
  default = [ "10.0.2.0/24", "10.0.03.0/24" ]
}

