provider "aws" {
  region = var.region
}

# Create a VPC
resource "aws_vpc" "vpc_terraform" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  tags = {
    Name = var.vpc_name
  }
}

# Create subnets in two Availability Zones
resource "aws_subnet" "subnet_a" {
  vpc_id                  = aws_vpc.vpc_terraform.id
  cidr_block              = var.subnet_a_cidr_block
  availability_zone       = "us-east-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet-a"
  }
}

resource "aws_subnet" "subnet_b" {
  vpc_id                  = aws_vpc.vpc_terraform.id
  cidr_block              = var.subnet_b_cidr_block
  availability_zone       = "us-east-2b"
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet-b"
  }
}

# Create an internet gateway
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc_terraform.id
  tags = {
    Name = "internet-gateway"
  }
}

# Create a route table
resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpc_terraform.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "route-table"
  }
}

# Associate the route table with the subnets
resource "aws_route_table_association" "association_a" {
  route_table_id = aws_route_table.route_table.id
  subnet_id      = aws_subnet.subnet_a.id
}

resource "aws_route_table_association" "association_b" {
  route_table_id = aws_route_table.route_table.id
  subnet_id      = aws_subnet.subnet_b.id
}

# Create a security group
resource "aws_security_group" "my_securitygroup" {
  vpc_id = aws_vpc.vpc_terraform.id
  description = "Allow inbound traffic on port 3306"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "security-group"
  }
}

# Create an RDS instance
resource "aws_db_instance" "db_instance" {
  allocated_storage       = var.allocated_storage
  storage_type            = "gp2"
  engine                  = var.db_engine
  instance_class          = var.db_instance_class
  identifier  = var.db_instance_identifier
  username                = var.db_username
  #password          = 
  publicly_accessible     = var.publicly_accessible
  vpc_security_group_ids  = [aws_security_group.my_securitygroup.id]
  db_subnet_group_name    = aws_db_subnet_group.db_subnet_group.name
  multi_az                = false

  tags = {
    Name = "rds-instance"
  }
}

# Create a DB subnet group for RDS
resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "db-subnet-group"
  subnet_ids = [aws_subnet.subnet_a.id, aws_subnet.subnet_b.id]

  tags = {
    Name = "db-subnet-group"
  }
}
