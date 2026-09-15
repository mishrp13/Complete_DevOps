output "vpc_id" {
  description = "The ID of the VPC"
  value = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "List of Public Subnet IDS"
  value = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "List of Private Subnet IDs"
  value = aws_subnet.private[*].id
}

output "load_balancer_dns" {
  description = "DNS name of the Application Load Balancer"
  value = aws_lb.app_lb.dns_name
}

output "load_balancer_arn" {
  description = "ARN of the Application Load Balancer"
  value = aws_lb.app_lb.arn
}

output "autoscaling_group_name" {
  description = "Name of the Autoscaling group"
  value = aws_autoscaling_group.app_sg.name
}

output "nat_gateway_ips" {
  description = "Elastic IPs of the NAT Gateways"
  value = aws_eip.main[*].public_ip
}