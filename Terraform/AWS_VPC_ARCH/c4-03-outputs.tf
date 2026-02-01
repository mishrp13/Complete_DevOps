output "vpc_id" {
  description = "The Id of the VPC"
  value = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "CIDR block of the vpc"
  value = module.vpc.vpc_cidr_block

}

output "private_subnets" {
  description = "List of IDs of Private Subnets"
  value = module.vpc.private_subnets
}

output "public_subnets" {
  description = "The List of Ids of Public subnets"
  value = module.vpc.public_subnets
}

output "nat_public_ips" {
  description = "Nat public Ips"
  value = module.vpc.nat_public_ips
}

output "azs" {
  description = "List of availablity zones"
  value = module.vpc.azs
}