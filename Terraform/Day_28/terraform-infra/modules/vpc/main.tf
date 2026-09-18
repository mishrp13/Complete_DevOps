# VPC

resource "aws_vpc" "main" {
  cidr_block = vpc.cidr_block
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = merge(
    var.tags,
    {
      Name="${var.environment}-${var.project}-vpc"
    }
  )
}

# Internet gateway

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.tags,
    {
      Name="${var.environment}-${var.project}-igw"
    }
  )
}


# Public subnet (web Tier)

resource "aws_subnet" "public" {
  count= length(var.availability_zones)
  vpc_id= aws_vpc.main.id
  cidr_block = var.public_subnet_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = merge(
    var.tags,
    {
      Name= "${var.environment}-${var.project}-public-subnet-${count.index+1}"
      Tier= "Public"
    }
  )
}

# Frontend Private subnets (App Tier- Frontend)

resource "aws_subnet" "frontend" {
  count = length(var.availability_zones)
  vpc_id = aws_vpc.main.id
  cidr_block = var.frontend_subnet_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = merge(
    var.tags,
    {
      Name= "${var.environment}-${var.project}-frontend-subnet-${count.index+1}"
      Tier="frontend"
    }
  )


}


# Backend private subnet -(App Tier- Backend)

resource "aws_subnet" "backend" {
  count = length(var.availability_zones)
  vpc_id = aws_vpc.main.id
  cidr_block = var.backend_subnet_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = merge(
    var.tags,
    {
      Name= "${var.environment}-${var.project}-backend-subnet-${count.index+1}"
      Tier= "backend"
    }
  )
}

# Database Isolated Subnets

resource "aws_subnet" "data" {
  count = length(var.availability_zones)
  vpc_id = aws_vpc.main.id
  cidr_block = var.database_subnet_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = merge(
    {
      Name= "${var.environment}-${var.project}-database-subnet-${count.index+1}"
      Tier= "Databse"
    }
  )
}


