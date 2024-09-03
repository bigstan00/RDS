# Output the VPC ID
output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.vpc_terraform.id
}

# Output the IDs of the subnets
output "subnet_a_id" {
  description = "The ID of the subnet in availability zone us-east-2a"
  value       = aws_subnet.subnet_a.id
}

output "subnet_b_id" {
  description = "The ID of the subnet in availability zone us-east-2b"
  value       = aws_subnet.subnet_b.id
}

# Output the Internet Gateway ID
output "internet_gateway_id" {
  description = "The ID of the internet gateway"
  value       = aws_internet_gateway.internet_gateway.id
}

# Output the Route Table ID
output "route_table_id" {
  description = "The ID of the route table"
  value       = aws_route_table.route_table.id
}

# Output the IDs of the Route Table Associations
output "route_table_association_a_id" {
  description = "The ID of the route table association with subnet-a"
  value       = aws_route_table_association.association_a.id
}

output "route_table_association_b_id" {
  description = "The ID of the route table association with subnet-b"
  value       = aws_route_table_association.association_b.id
}

# Output the Security Group ID
output "security_group_id" {
  description = "The ID of the security group"
  value       = aws_security_group.my_securitygroup.id
}

# Output the RDS instance endpoint
output "db_instance_endpoint" {
  description = "The endpoint of the RDS instance"
  value       = aws_db_instance.db_instance.endpoint
}

# Output the RDS instance ID
output "db_instance_id" {
  description = "The ID of the RDS instance"
  value       = aws_db_instance.db_instance.id
}

# Output the RDS instance ARN
output "db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = aws_db_instance.db_instance.arn
}

# Output the RDS instance database name
output "db_instance_database_name" {
  description = "The name of the RDS database"
  value       = aws_db_instance.db_instance.db_name
}
