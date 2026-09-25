variable "environment" {
  description = "Environment...(dev,stag,prod)"
  type = string
}

variable "project_name" {
  description = "Name of the project"
  type = string
}

variable "ami_id" {
  description = "AMI ID for bastion host (leave empty for amazon linux 2023) "
  type = string
  default = ""
}

variable "instance_type" {
  description = "EC2 instance type"
  type = string
  default = "t2.micro"
}

variable "key_name" {
  description = "SSH key pair name"
  type = string
}

variable "subnet_id" {
  description = "Public subnet ID where bastion is launched"
  type = string
}

variable "security_group_id" {
  description = "Security group ID for the bastion host"
  type = string
}

variable "iam_instance_profile" {
  description = "IAM istance profile name for the bastion"
  type = string
}

variable "tags" {
    description = "common tags to apply all the resources"
    type = map(string)
    default = {}
}