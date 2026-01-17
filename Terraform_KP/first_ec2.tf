provider "aws" {
  region     = "us-east-1"
  access_key = "my-access-key"
  secret_key = "my-secret-key"
}

resource "aws_instance" "my_ec2_instance" {
  ami= "ami-07ff62358b87c7116"
  instance_type = "t2.micro"
  tags={
    Name= "my_first_ec2"
  }
}