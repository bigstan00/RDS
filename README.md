# Terraform AWS VPC and RDS Setup

This repository contains Terraform configuration files for setting up an AWS infrastructure that includes a Virtual Private Cloud (VPC), subnets across multiple Availability Zones (AZs), and an Amazon RDS instance. The configuration also includes a security group that allows inbound traffic on port 3306 (MySQL).

## Overview

The Terraform setup will create:

- A VPC with DNS support and DNS hostnames enabled.
- Two subnets in different Availability Zones (`us-east-2a` and `us-east-2b`).
- An Internet Gateway attached to the VPC.
- A Route Table with a default route to the Internet Gateway.
- A Security Group with inbound rules for port 3306 (MySQL).
- An RDS instance running MySQL, attached to the VPC and subnets.

## Files

- **main.tf**: Contains the main Terraform configuration for creating the VPC, subnets, Internet Gateway, Route Table, Security Group, and RDS instance.
- **variables.tf**: Contains variable definitions for customizing the configuration.
- **outputs.tf**: Contains output definitions to display information about the created resources.
- **README.md**: This file, which provides an overview and instructions for the Terraform setup.

## Variables

The following variables are defined in `variables.tf`:

- `region`: The AWS region where resources will be created.
- `vpc_cidr_block`: CIDR block for the VPC.
- `enable_dns_support`: Whether DNS support is enabled for the VPC.
- `enable_dns_hostnames`: Whether DNS hostnames are enabled for the VPC.
- `vpc_name`: The name tag for the VPC.
- `subnet_a_cidr_block`: CIDR block for subnet in availability zone us-east-2a.
- `subnet_b_cidr_block`: CIDR block for subnet in availability zone us-east-2b.
- `db_instance_identifier`: Identifier for the RDS instance.
- `db_engine`: RDS engine type (e.g., `mysql`).
- `db_instance_class`: RDS instance class (e.g., `db.t3.micro`).
- `allocated_storage`: Allocated storage for the RDS instance in GB.
- `db_username`: Master username for the RDS instance.
- `db_password`: Master password for the RDS instance.
- `publicly_accessible`: Whether the RDS instance should be publicly accessible.

## How to Use

1. **Install Terraform**: Ensure Terraform is installed on your system. You can download it from [Terraform's official website](https://www.terraform.io/downloads.html).

2. **Initialize Terraform**: Run `terraform init` to initialize the configuration and download the necessary provider plugins.

3. **Terraform Plan**: "terraform plan" command is used to create an execution plan. This plan outlines the changes that Terraform will make to your infrastructure in order to reach the desired state defined in your configuration files. ## A blueprint of your infrasture as a code ##

4. **Terraform Validate**: terraform validate command is used to check if all code are valide

5. **Terraform Apply**: terraform apply command is used to apply the changes required to reach the desired state defined in your Terraform configuration files
