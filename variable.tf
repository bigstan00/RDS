# Variable for the AWS region
variable "region" {
  description = "The AWS region where resources will be created"
  type        = string
  default     = "us-east-2"  # Adjust the default region as needed
}

# Variable for the VPC CIDR block
variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# Variable to enable DNS support
variable "enable_dns_support" {
  description = "Whether DNS support is enabled for the VPC"
  type        = bool
  default     = true
}

# Variable to enable DNS hostnames
variable "enable_dns_hostnames" {
  description = "Whether DNS hostnames are enabled for the VPC"
  type        = bool
  default     = true
}

# Variable for VPC name tag
variable "vpc_name" {
  description = "The name tag for the VPC"
  type        = string
  default     = "my-vpc"
}

# Variable for subnet CIDR block in Availability Zone us-east-2a
variable "subnet_a_cidr_block" {
  description = "CIDR block for subnet in availability zone us-east-2a"
  type        = string
  default     = "10.0.1.0/24"
}

# Variable for subnet CIDR block in Availability Zone us-east-2b
variable "subnet_b_cidr_block" {
  description = "CIDR block for subnet in availability zone us-east-2b"
  type        = string
  default     = "10.0.2.0/24"
}

# Variable for RDS instance identifier
variable "db_instance_identifier" {
  description = "Identifier for the RDS instance"
  type        = string
  default     = "mydbinstance"
}

# Variable for RDS engine
variable "db_engine" {
  description = "RDS engine"
  type        = string
  default     = "mysql"
}

# Variable for RDS instance class
variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

# Variable for allocated storage for RDS
variable "allocated_storage" {
  description = "Allocated storage for the RDS instance in GB"
  type        = number
  default     = 20
}

# Variable for RDS master username
variable "db_username" {
  description = "Master username for the RDS instance"
  type        = string
  default     = "admin"
}

# Variable for RDS master password
#variable "db_password" {
#  description = "Master password for the RDS instance"
#  type        = string
#  sensitive   = true
#}

# Variable to specify if the RDS instance should be publicly accessible
variable "publicly_accessible" {
  description = "Whether the RDS instance should be publicly accessible"
  type        = bool
  default     = true
}
