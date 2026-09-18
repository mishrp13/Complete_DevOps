variable "environment" {
  description = "Environment Name (e.g.,dev,staging,prod)"
  type = string
}

variable "project" {
  description = "Project Name"
  type = string
}

variable "name_prefix" {
  description = "Prefix for the ALB name (e.g., 'public-','private-')"
  type = string
  default = ""
}

variable "internal" {
    description = "Whether the ALB is internal"
    type = bool
    default = false
  
}

variable "vpc_id" {
  description = "VPC ID"
  type = string
}

variable "target_group_port" {
  description = "Port for the target group"
  type = number
  default = 3000
}

variable "subnet_ids" {
  description = "List of Public subnet IDs for ALB"
  type = list(string)
}

variable "security_group_id" {
    description = "Security group ID for ALB"
    type = string  
}

variable "enable_deletion_protection" {
  description = "Enable deletion protection for ALB"
  type = bool
  default = false
}

variable "certificate_arn" {
  description = "ACM certificates ARN for HTTPS Listener(leave empty to disable HTTPS)"
  type = string
  default = ""
}

variable "tags" {
  description = "common tags to apply all resources"
  type = map(string)
  default= {}
}



