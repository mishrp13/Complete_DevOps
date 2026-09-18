variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type = string
  default = "10.0.0.0/16"
}

variable "environment" {
  description = "Name of the environment. (e.g .,dev,stag,prod)"
  type = string
}

variable "project" {
  description = "Project Name"
  type = string
}

variable "availability_zones" {
  description = "List of Availability Zones"
  type = list(string)
}

variable "public_subnet_cidrs" {
  description = "CIDR block for the public subnet"
  type = list(string)
}

variable "frontend_subnet_cidrs" {
  description = "CIDR block for the frontend private subnets"
  type = list(string)
}

variable "backend_subnet_cidrs" {
  description = "CIDR blocks for backend private subnet"
  type = list(string)
}

variable "database_subnet_cidrs" {
    description = "CIDR block for database isolated subnets" 
    type = list(string)  
}

variable "enable_nat_gateway" {
  description = "Enable NAT gateway for private subnets"
  type = bool
  default = true
}

variable "single_nat_gateway" {
  description = "Use a single NAT gateway for all private subnets(cost optimization)"
  type = bool
  default = false
}

variable "tags" {
  description = "Common tags to apply all the resources"
  type = map(string)
  default= {}
}

