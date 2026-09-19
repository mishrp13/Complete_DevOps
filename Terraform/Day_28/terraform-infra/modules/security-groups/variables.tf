variable "environment" {
    description = "Environment of the Project (dev,stag,prod)"
    type = string
  }

variable "project" {
    description = "Name of the Project"
    type = string
}

variable "vpc_id" {
  description = "VPC ID where the security group will be created"
  type = string
}

variable "allowed_ssh_cidrs" {
  description = "List of CIDR blocks allowed to SSH to bastion host"
  type = list(string)
  default = [ "0.0.0.0/0" ]
}

variable "tags" {
  description = "common tags to apply all resources"
  type = map(string)
  default = {}
}

