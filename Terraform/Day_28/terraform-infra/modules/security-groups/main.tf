# security group for the Application Load Balancer

resource "aws_security_group" "alb" {
  name="${var.environment}-${var.project}-alb-sg"
  description = "security group for the application LOad Balancer"
  vpc_id = var.vpc_id

  ingress  {
    description="HTTP from Internet"
    from_port= 80
    to_port= 80
    protocol="tcp"
    cidr_blocks= ["0.0.0.0/0"]
  }

   ingress {

    description = "HTTPS from the internet"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
   }

   egress {
    description = "Allow all outbound traffic"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
   }

   tags = merge(
    {
        Name= "${var.environment}-${var.project}-alb-sg"
    }
   )


}

# security group for internal Application Load Balancer

resource "aws_security_group" "internal_alb" {
  name="${var.environment}-${var.project}-internal-alb-sg"
  description = "Creating security group for internal application Load balancer"
  vpc_id = var.vpc_id

  ingress {
    description = "HTTP from frontend"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    security_groups = [aws_security_group.frontend.id]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    {
        Name="${var.environment}-${var.project}-internal-alb-sg"
    }
  )

}


# security group for bastion host

resource "aws_security_group" "bastion" {
  name = "${var.environment}-${var.project}-bastion-sg"
  description = "Security group for bastion host"
  vpc_id = var.vpc_id

  ingress {
    description = "ssh from allowed IPs"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = var.allowed_ssh_cidrs

  }

  egress {
    description = "Allow all outbound traffic"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.tags,
    {
      name="${var.environment}-${var.project}-bastion-sg"
    }
  )
}

# security group for frontend ec2 instance

resource "aws_security_group" "frontend" {
  name = "${var.environment}-${var.project}-frontend-sg"
  description = "Security group for the frontend application server"
  vpc_id = var.vpc_id

  ingress {
    description = "http from ALB"
    from_port = 3000
    to_port = 3000
    protocol = "tcp"
    security_groups = [aws_security_group.alb.id]
  }

  ingress {
    description = "ssh from Bastion"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    security_groups = [aws_security_group.bastion.id]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.tags,
    {
      name= "${var.environment}-${var.project}-frontend-sg"
    }
  )
}

# security group for backend EC2 Instances

resource "aws_security_group" "backend" {
  name = "${var.environment}-${var.project}-backend-sg"
  description = "security group for backend API Server"
  vpc_id = var.vpc_id

  ingress {
    description = "API from Internal ALB"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    security_groups = [aws_security_group.internal_alb.id]
  }

  ingress {
    description = "SSH from bastion"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    security_groups = [aws_security_group.bastion.id]
  }

  egress {
    description = "Allow all outbound Traffic"
    from_port = -1
    to_port = -1
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.tags,
    {
      name= "${var.environment}-${var.project}-backend-sg"
    }
  )
}

# security group for RDS postgresql

resource "aws_security_group" "rds" {
  name = "${var.environment}-${var.project}-rds-sg"
  description = "Security group for RDS prostgresql"
  vpc_id = var.vpc_id

  ingress {
    description = "Allow traffic from backend sg"
    from_port = 5432
    to_port = 5432
    protocol = "tcp"
    security_groups = [aws_security_group.backend.id]
  }
  egress {
    description = "No Outbound Traffic from rds"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = []
  }

  tags = merge(
    var.tags,
    {
      name="${var.environment}-${var.project}-rds-sg"
    }
  )
}

# HTTP	80	Standard HTTP
# HTTPS	443	Standard HTTPS
# HTTP	8080	Common alternative HTTP/application port
# HTTPS	8443	Common alternative HTTPS port