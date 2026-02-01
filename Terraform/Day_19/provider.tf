variable "aws_region" {
  description = "Aws region to create resource in"
  type = string
  default = "us-east-1"
}

provider "aws" {
  region = var.aws_region
}