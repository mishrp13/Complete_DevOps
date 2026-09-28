terraform {
  required_version = ">=1.13"

  required_providers {
    aws={
        source = "hashicorp/aws"
        version = "~>6.0"
    }
     random = {
        source = "hashicorp/random"
        version = "~>3.7"
     }
  }

  backend "s3" {
    bucket = "terraform-state-bucket"
    key = "goal-tracker/dev/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    dynamodb_table = "terraform-state-lock"
  }
}

