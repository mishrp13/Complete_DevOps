output "vpc_id" {
  description = "The ID of the VPC"
  value = aws_vpc.main.id
}

output "vpc_cidr_block" {
  description = "The CIDR block for VPC"
  value = aws_vpc.main.cidr_block
}

output "public_subnets" {
  description = "List of ID's of Public Subnets"
  value = aws_subnet.public[*].id  
}

output "private_subnets" {
  description = "List of ID's of Private subnets"
  value = aws_subnet.private[*].id
}

output "public_subnet_cidrs" {
  description = "List of CIDR's of Public Subnet"
  value = aws_subnet.public[*].cidr_block
}

output "private_subnet_cidrs" {
  description = "List of CIDR's of Private Subnet"
  value = aws_subnet.private[*].cidr_block 
}

output "nat_gateway_id" {
  description = "List of NAT gateway ID's"
  value = aws_nat_gateway.main[*].id  
}

output "nat_gateway_public_ips" {
  description = "List of Public IP's of NAT gateway"
  value = aws.eip.nat[*].public_ip  
}

output "public_route_table_id" {
  description = "ID of the Public Route Table"
  value = aws_route_table.public.id
  
}

output "private_route_table_ids" {
  description = "List of ID's of Private route table"
  value = aws_route_table.private[*].id
}





