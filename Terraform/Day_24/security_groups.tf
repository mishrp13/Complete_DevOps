
# security group for application load balancer

resource "aws_security_group" "alb_sg" {
    name="alb-security-group"
    description = "Security Group for Application Load Balancer"
    vpc_id = aws_vpc.main.id

    ingress {
        description = "HTTP from internet"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "HTTPS from the internet"
        from_port = 443
        to_port = 443
        protocol = tcp
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        description = "Allow all outbound"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name= "alb-security-group"
    }
}

# security group for EC2 instances (App Tier)

resource "aws_security_group" "app_sg" {
  name = "app-security-group"
  description = "Security group for application instances - only allow traffic from alb"
  vpc_id = aws_vpc.main.id

  ingress {
    description = "HTTP from ALB only"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }

  ingress {
    description = "HTTPS from ALB only"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }

  egress {
    description = "Allow all outbound (for updates via NAT)"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name= "app-security-group"
  }
}

# security group for SSH access (optional-restrict to your ip)

resource "aws_security_group" "allow_ssh" {
  name = "allow-ssh"
  description = "Allow SSH access- Restrict this to your ip in production"
  vpc_id = aws_vpc.main.id

  ingress {
    description = "SSH from anywhere -change this"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # provide your IP
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name= "ssh-security-group"
  }
}
