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