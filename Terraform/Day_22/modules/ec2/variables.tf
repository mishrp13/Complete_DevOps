variable "project_name" {
  description = "Name of the project"
  type = string
} 

variable "environment" {
  description = "Name of the Environment"
  type = string
}

variable "isntance_type" {
  description = "Ec2 instance type"
  type= string
  default = "t2.micro"
}

variable "public_subnet_id" {
  description = "Id of the public subnet"
  type = string
}

variable "web_security_group_id" {
  description = "Security group id for the web server"
  type = string
}

variable "db_host" {
  description = "Database host endpoint"
  type = string
}

variable "db_username" {
  description = "Database username"
  type = string
  sensitive = true
}

variable "db_password" {
    description = "Database password"
    type = string
    sensitive = true
}

variable "db_name" {
  description = "Database name"
  type = string
}





