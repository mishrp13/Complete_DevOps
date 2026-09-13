variable "name_prefix" {
  description = "Prefix for resource name"
  type = string
}

variable "create_db_secret" {
  description = "Create Database credentials secret"
  type = bool
  default = false
}

variable "db_username" {
  description = "Database username"
  type = string
  default = ""
  sensitive = true
}

variable "db_password" {
  description = "Databse password"
  type=string
  default = ""
  sensitive = true
}

variable "db_engine" {
    description = "Database host"
    type = string
    default = "postgress"
  
}

variable "db_host" {
  description = "Database host"
  type = string
  default = ""
}

variable "db_port" {
    description = "Database port"
    type = number
    default = 5432
  
}

variable "db_name" {
  description = "Database name"
  type = string
  default = ""
}

variable "create_api_secret" {
  description = "Create APIs Key secret"
  type = bool
  default = false
}

variable "api_key" {
  description = "API Key"
  type = string
  default = ""
  sensitive = true
}

variable "create_app_config_secret" {
  description = "create application config secret"
  type = bool
  default = false
}

variable "app_config" {
  description = "Application configuration as map"
  type = map(string)
  default = {}
  sensitive = true
}

variable "tags" {
    description = "Tags to apply to all resources"
    type = map(string)
    default = {}
    }
  
