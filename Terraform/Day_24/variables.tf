variable "region" {
  description = "The AWS region to deploy the infrastructure"
  type = string
  default = "us-east-1"
}

variable "environment" {
  description = "Environment Name (e.g dev,staging,production)"
  type = string
  default = "production"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type = string
  default = "10.0.0.0/16"

}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for the public subnets"
  type = list(string)
  default = [ "10.0.1.0/24","10.0.2.0/24" ]
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for the private subnets"
  type = list(string)
  default = [ "10.0.11.0/24","10.0.12.0/24" ]
}

variable "public_subnet_count" {
  description = "Number of public subnet to create"
  type = number
  default = 2
}

variable "private_subnet_count" {
  description = "Number of private subnet to create"
  type = number
  default = 2
}

variable "availability_zones" {
  description = "value"
  type = list(string)
  default = [ "us-east-1a","us-east-1b" ]
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type = string
  default = "ami-0c398cb65a93047f2"
}

variable "instance_type" {
  description = "EC2 instance type"
  type = string
  default = "t2.micro"
}

variable "desired_capacity" {
  description = "Desired Number of EC2 instance in the Autoscaling Group"
  type = number
  default = 2
}

variable "max_size" {
  description = "Maximum number of EC2 instance in the Autoscaling group"
  type = number
  default = 5
}

variable "min_size" {
  description = "Minimum number of EC2 instance in the autoscaling group"
  type = number
  default = 1
}

