variable "environment" {
  description = "Name of the environment..(dev,stag,prod)"
  type = string
}

variable "project" {
  description = "Project name"
  type = string
}

variable "subnet_ids" {
  description = "List of Subnet Ids for DB subnet group"
  type = list(string)
}

variable "security_group_id" {
  description = "Security group ID for RDS"
  type = string
}

variable "instance_class" {
  description = "RDS instance class"
  type = string
  default = "db.t3.micro"
}

variable "allocated_storage" {
  description = "Allocated storage in GB"
  type = number
  default = 20
}

variable "engine_version" {
  description = "Postgresql engine version"
  type = string
  default = "15.5"
}

variable "db_name" {
  description = "Database name"
  type = string
  default = "goalsdb"
}

variable "db_username" {
  description = "Master Username"
  type = string
  default = "postgres"
  
}

variable "db_password" {
  description = "Master Password"
  type = string
  sensitive = true
}

variable "multi_az" {
  description = "Enable Multi-AZ deployment"
  type = bool
  default = false
}

variable "availability_zone" {
  description = "Availability zone for single AZ deployment"
  type = string
  default = null
}

variable "backup_retention_period" {
  description = "Backup retention period in days"
  type = string
  default =7
}

variable "skip_final_snapshot" {
  description = "skip final snapshot before destroying"
  type = bool
  default = false
}

variable "deletion_protection" {
  description = "Enable deletion protection"
  type = bool
  default = false
}

variable "monitoring_interval" {
  description = "Enhanced monitoring interval in seconds (0,1,5,10,15,30,60)"
  type = string
  default = 0
}

variable "tags" {
  description = "Common tags to apply all the resources"
  type = map(string)
  default = {}
}