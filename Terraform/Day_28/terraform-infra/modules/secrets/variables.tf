variable "environment" {
  description = "Name of the environment ..(dev,stag,prod)"
  type = string
}

variable "project" {
  description = "project name"
  type = string
}

variable "db_username" {
    description = "Database master username"
    type = string
    default = "postgres"
}

variable "db_password" {
  description = "Database master password"
  type = string
  sensitive = true
}

variable "db_host" {
  description = "Database endpoint name"
  type = string
}

variable "db_port" {
  description = "Database port"
  type = number
  default = 5432
}

variable "db_name" {
  description = "Database name"
  type = string
  default = "goalsdb"
}

variable "recovery_window_in_days" {
  description = "Number of days to retain secret after deletion ( 0 for immediate deleteion, 7-30 for recovery window)"
  type = number
  default = 0
}

variable "tags" {
    description = "Common tags to apply all the reosurces"
    type = map(string)
    default = {}
  
}