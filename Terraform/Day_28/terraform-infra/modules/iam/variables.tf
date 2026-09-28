variable "environment" {
  description = "Name of the environment..eg(dev,stag,prod)"
  type = string
}

variable "project" {
  description = "Project name"
  type = string
}

variable "secrets_arns" {
  description = "List of Secrets Manager ARNs that EC2 can access"
  type = list(string)
  default = [ "*" ]
}

variable "tags" {
  description = "common tags to apply all resources"
  type = map(string)
  default = {}
}

