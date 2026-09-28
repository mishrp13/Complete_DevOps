variable "region" {
  description = "AWS region"
  type = string
  default = "us-east-1"
}

variable "environment" {
  description = "Environment name"
  type = string
  default = "dev"
}

variable "project" {
  description = "Name of the project"
  type = string
  default = "goal-tracker"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type = string
  default = "10.0.0.0/16"
}

variable "availability_zone" {
  description = "List of availability zones"
  type = list(string)
  default = [ "us-east-1a","us-east-1b" ]
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type = list(string)
  default = [ "10.0.1.0/24","10.0.2.0/24" ]
}

variable "frontend-subnet_cidrs" {
  description = "CIDR block for frontend subnets"
  type = list(string)
  default = [ "10.0.11.0/24","10.0.12.0/24" ]
}

variable "backend_subnet_cidrs" {
  description = "CIDR block for backend subnets"
  type = list(string)
  default = [ "10.0.21.0/24","10.0.22.0/24" ]
}

variable "database_subnet_cidrs" {
  description = "CIDR block for database subnets"
  type = list(string)
  default = [ "10.0.31.0/24","10.0.32.0/24" ]
}

variable "single_nat_gateway" {
  description = "use single NAT gateway to save the cost"
  type = bool
  default = true
}

variable "ssh_key_name" {
  description = "SSh key pair name for ec2 instance"
  type = string
}

variable "allowed_ssh_cidrs" {
  description = "CIDR block to allowed to ssh to bastion(your IP)"
  type = string
  default = "0.0.0.0/0"
}

variable "bastion_instance_type" {
  description = "Bastion instance type"
  type = string
  default = "t2.micro"
}

variable "frontend_instance_type" {
  description = "Frontend instance type"
  type = string
  default = "t3.micro"
}

variable "frontend_min_size" {
  description = "Frontend ASG minimum size"
  type = number
  default = 2
}

variable "frontend_max_size" {
  description = "Frontend ASG max size"
  type = number
  default = 4
}

variable "frontend_desired_capacity" {
  description = "Frontend ASG desired capacity"
  type = number
  default = 2
}

variable "backend_instance_type" {
  description = "Backend instance type"
  type = string
  default = "t3.micro"
}

variable "backend_min_size" {
  description = "Backend ASG minimum size"
  type = number
  default = 2
}

variable "backend_max_size" {
  description = "Backend ASG maximum size"
  type = number
  default = 4
}

variable "backend_desired_capacity" {
  description = "Backend ASG desired capacity"
  type = number
  default = 2
}

# RDS

variable "db_instance_class" {
  description = "RDS instance class"
  type = string
  default = "db.t3.micro"
}

variable "db_allocated_storage" {
  description = "RDS allocated storage in GB"
  type = number
  default = 20
}

variable "db_engine_version" {
  
}