variable "instance_type" {
  description = "EC2 instance type"
  type = string
  default = "t3.micro"
}

variable "key_name" {
  description = "Name of an Existing EC2 key pair (must already exist in the chosen region)"
  type = string
}

variable "private_key_path" {
  description = "path to the private key file for ssh(used by remote provisoner)"
  type = string
}

variable "ssh_user" {
  description = "SSh username for the ami (default for ubuntu is 'ubuntu)"
  type = string
  default = "ubuntu"
}