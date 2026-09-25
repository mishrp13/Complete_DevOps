variable "environment" {
  description = "Name of the environment..(dev,stag,prod)"
  type = string
}

variable "project" {
  description = "Name of the project"
  type = string
}

variable "region" {
  description = "value"
}

variable "ami_id" {
  description = "AMI ID (leave empty for linux amazon linux 2023)"
  type = string
  default = ""
}

variable "instance_type" {
  description = "EC2 instance type"
  type = string
  default = "t3.micro"
}

variable "key_name" {
  description = "SSH key pair name"
  type = string
}

variable "iam_instance_profile" {
  description = "IAM instance profile name"
  type = string
}

variable "security_group_id" {
  description = "Security group ID for frontend instances"
  type = string
}

variable "subnet_ids" {
  description = "List of subnet for the ASG"
  type = list(string)
}

variable "target_group_arn" {
  description = "Target group ARN for ALB"
  type = string
}

variable "min_size" {
  description = "Minimum number of instances"
  type = number
  default = 2
}

variable "max_size" {
  description = "Maximum number of instances"
  type = number
  default = 4
}

variable "desired_capacity" {
  description = "desired number of instances"
  type = number
  default = 2
}

variable "docker_image" {
  description = "Full docker image name (eg:username/image:tag)"
  type = string
}

variable "dockerhub_username" {
  description = "Docker hub username(optiomal for public images)"
  type = string
  default = ""
}

variable "dockerhub_password" {
  description = "Docker Hub Password(optional for the public images)"
  type = string
  default = ""
  sensitive = true
}

variable "backend_internal_url" {
  description = "Internal URL for backend service"
  type = string
}

variable "alarm_sctions" {
  description = "List of ARNS for alaram (SNS topics)"
  type=list(string)
  default=[]  
}

variable "tags" {
  description = "common tags to apply all the resources"
  type = map(string)
  default = {}
}