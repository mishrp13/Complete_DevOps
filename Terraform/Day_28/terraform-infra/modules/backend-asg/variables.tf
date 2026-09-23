variable "environment" {
  description = "Environment name..(dev,stag,prod)"
  type = string
}

variable "project" {
  description = "Name of the Project"
  type = string
}

variable "region" {
  description = "AWS Region"
  type = string
}

variable "ami_id" {
  description = "AMI ID(Leave empty for latest amazon linux)"
  type = string
  default = ""
}

variable "instance_type" {
  description = "EC2 instance type"
  type = string
  default = "t3.micro"
}

variable "key_name" {
  description = "SSH Key pair name"
  type = string
}

variable "iam_instance_profile" {
  description = "IAM instance profile name"
  type = string
}

variable "security_group_id" {
    description = "security group id for the backend instances"
    type = string
  
}

variable "subnet_ids" {
  description = "List of subnet ID's for ASG"
  type = list(string)
}

variable "min_size" {
  description = "Minimum number of instances"
  type = number
  default = 2
}

variable "max_size" {
  description = "Maximum number of instances"
  type = number
  default = 6
}

variable "desired_capacity" {
  description = "Desired number of instances"
  type = number
  default = 2
}

variable "docker_image" {
  description = "Full Docker image Name (e.g., username/image:tag)"
  type = string
}

variable "docker_hub_username" {
  description = "Docker hub username (optional for public images)"
  type = string
  default = ""
}

variable "dockerhub_password" {
  description = "Docker hub password or access token(optional for public images)"
  type = string
  default = ""
  sensitive = true
}

variable "db_secret_arn" {
  description = "ARN of the secrets manager secrets containing database credentials"
  type = string
}

variable "target_group_arns" {
  description = "List of Target group ARNs to attach to the ASG"
  type = list(string)
  default = [  ]
}

variable "alarm_actions" {
  description = "List of ARNs for alarm actions (e.g., sns topics)"
  type = list(string)
  default = [  ]
}

variable "tags" {
  description = "common tags to apply all resources"
  type = map(string)
  default = {}
}

