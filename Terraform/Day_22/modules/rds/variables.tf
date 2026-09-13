variable "project_name" {
  description = "Name of the project"
  type = string
}

variable "environment" {
  description = "Name of the Environment"
  type = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for DB subnet group"
  type = list(string)
}

variable "db_security_group_id" {
  description = "Security group id for the database"
  type = string
}

variable "db_name" {
  description = "Name of the database"
  type = string
  default = "webappdb"
}

variable "db_username" {
    description = "Database master username"
    type = string
    sensitive = true
}

variable "db_password" {
  description = "Database master password"
  type = string
  sensitive = true
}

variable "instance_class" {
    description = "RDS instance class"
    type = string
    default = "db.t3.micro"
  
}

variable "allocated_storage" {
  description = "Allocated storage in DB"
  type=number
  default = 10
}

variable "engine_version" {
  description = "MYSQL Engine Version"
  type = string
  default = "8.0"
}

