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

# Elastic Ips for NAT Gateway

resource "aws_eip" "nat" {
  count = var.enable_nat_gateway ? (var.single_nat_gateway ? 1 : length(var.availability_zones)):0
  domain = "vpc"

  tags = merge(
    var.tags,
    {
      Name= "${var.environment}-${var.project}-nat-eip-${count.index +1}"

    }
  )
}


# Nat Gateway

resource "aws_nat_gateway" "main" {
  count = var.enable_nat_gateway ? (var.single_nat_gateway ? 1 : length(var.availability_zones)):0
  allocation_id = aws_eip.nat[count.index].id
  subnet_id = aws_subnet.public[count.index].id

  tags = merge(
    var.tags,
    {
      Name="${var.environment}-${var.project}-nat-gw-${count.index+1}"
    }
  )

  depends_on = [ aws_internet_gateway.main ]
}


# Route Table for public subnet

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.tags,
    {
      Name= "${var.environment}-${var.project}-public-rt"
    }
  )
}

# Route for public subnets to internet gateway

resource "aws_route" "public_internet" {
  route_table_id = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.main.id
}


# associate Public subnets with Public route Table

resource "aws_route_table_association" "public" {
  count = length(var.availability_zones)
  subnet_id = aws_subnet.public[count.index].index
  route_table_id =   aws_route_table.public.id
}

# Route Tables for Frontend Private subnets

resource "aws_route_table" "frontend" {
  count= var.enable_nat_gateway ? length(var.availability_zones) : 0
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.tags,
    {
      Name= "${var.environment}-${var.project}-frontend-rt-${count.index+1}"
      Tier="frontend"
    }
  )
}

# Route For frontend Subnets to NAT Gateway

resource "aws_route" "frontend_nat" {
  count = var.enable_nat_gateway ? length(var.availability_zones): 0
  route_table_id = aws_route_table.frontend[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = var.single_nat_gateway ? aws_nat_gateway.main[0].id : aws_nat_gateway.main[count.index].id

}

# Associate Frontend subnets with frontend Route Table

resource "aws_route_table_association" "frontend" {
  count = length(var.availability_zones)
  subnet_id = aws_subnet.frontend[count.index].id
  route_table_id = var.enable_nat_gateway ? aws_route_table.frontend[count.index].id : null
}

# Route Table for backend private subnets

resource "aws_route_table" "backend" {
  count = var.enable_nat_gateway ? length(var.availability_zones):0
  vpc_id = aws_vpc.main.id

  tags = merge(
    {
      Name= "${var.environment}-${var.project}-backent-rt-${count.index+1}"
      Tier="backend"
    }
  )
}

# Route for backend subnet to NAT Gateway

resource "aws_route" "backend_nat" {
  count = var.enable_nat_gateway ? length(var.availability_zones):0
  route_table_id = aws_route_table.backend.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = var.single_nat_gateway ? aws_nat_gateway[0].id : aws_nat_gateway.main[count.index].id 
}


#Associate backend subnets with backend Route Table

resource "aws_route_table_association" "backend" {
  count = length(var.availability_zones)
  subnet_id= aws_subnet.backend[count.index].id
  route_table_id = var.enable_nat_gateway ? aws_route_table.baackend[count.index].id :null 
}






