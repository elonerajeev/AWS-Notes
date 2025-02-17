terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Create a VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

# Create subnets in different availability zones
resource "aws_subnet" "subnets" {
  count             = 2
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.${count.index}.0/24"
  availability_zone = element(var.availability_zones, count.index)
}

# Create a security group
resource "aws_security_group" "allow_http" {
  name_prefix = "http-sg"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create EC2 instances
resource "aws_instance" "web" {
  ami                    = "ami-05b4ded3ceb71e470"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.subnets[0].id  # Reference the created subnet
  vpc_security_group_ids = [aws_security_group.allow_http.id]  # Reference the security group by ID

  tags = {
    Name = "WebServer-0"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo yum install -y httpd
              sudo systemctl start httpd
              sudo systemctl enable httpd
              echo "Hello from $(hostname)" > /var/www/html/index.html
              EOF
}

output "instance_public_ips" {
  value = aws_instance.web[*].public_ip
}
output "instance_public_ips" {
  value = aws_instance.web[*].public_ip
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}
