output "instance_id" {
  description = "Id of the EC2 instance"
  value = aws_instance.web.id
}

output "public_ip" {
  description = "Public Ip of the EC2 instance"
  value = aws_instance.web.public_ip
}

output "public_dns" {
  description = "Public DNS of EC2 instance"
  value = aws_instance.web.public_dns
}