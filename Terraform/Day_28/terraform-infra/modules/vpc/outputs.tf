output "vpc_id" {
  description = "ID of the VPC"
  value = aws_vpc.main.id
}

output "vpc_cidr" {
  description = "CIDR block of the VPC"
  value = aws_vpc.main.cidr_block
}

output "public_subnet_ids" {
    description = "List of public subnet ID"
    value = aws_subnet.public[*].id
}

output "frontend_subnet_ids" {
  description = "List of frontend Subnet Ids"
  value = aws_subnet.frontend[*].id
}

output "backend_subnet_ids" {
  description = "List of backend subnet Ids"
  value = aws_subnet.backend[*].id
}

output "database_subnet_ids" {
  description = "List of Database subnet IDs"
  value = aws_subnet.database[*].id
}

output "nat_gateway_ips" {
  description = "Elastic IPs for Nat gateway"
  value = aws_eip.nat[*].public_ip
}

output "internet_gateway_id" {
  description = "If of the Internet Gateway"
  value = aws_internet_gateway.main.id
}