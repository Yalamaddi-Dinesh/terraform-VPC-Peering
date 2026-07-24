# AWS VPC Peering using Terraform

## Project Overview

This project demonstrates how to create an AWS VPC Peering Connection using Terraform Infrastructure as Code (IaC). The purpose of this project is to establish private network communication between two Amazon Virtual Private Clouds (VPCs), allowing resources in different VPCs to communicate securely over AWS's private network.

Terraform automates the entire infrastructure provisioning process, making deployments repeatable, consistent, and easy to manage.

---

## Architecture

The project creates the following AWS resources:

- VPC 1
- VPC 2
- Public Subnets
- Route Tables
- Internet Gateways
- VPC Peering Connection
- Route Table Entries for Peering
- Security Groups

```
           VPC 1
     10.0.0.0/16
          |
          |
   VPC Peering Connection
          |
          |
     10.1.0.0/16
           VPC 2
```

## Prerequisites

Before deploying this project, ensure you have:

- AWS Account
- IAM User with required permissions
- AWS CLI configured
- Terraform installed
- Git (optional)

---

## AWS Resources Used

- Amazon VPC
- Subnets
- Route Tables
- Internet Gateway
- VPC Peering Connection
- Security Groups
---

## Terraform Commands

### Initialize Terraform

```bash
terraform init
```

### Validate Configuration

```bash
terraform validate
```

### Preview Infrastructure

```bash
terraform plan
```

### Create Infrastructure

```bash
terraform apply
```

Type:

```
yes
```

to confirm.

### Destroy Infrastructure

```bash
terraform destroy
```

---

## How VPC Peering Works

A VPC Peering Connection creates a private connection between two VPCs.

Once the peering connection is established:

- Resources in both VPCs can communicate using private IP addresses.
- Traffic remains within the AWS network.
- No VPN or Internet Gateway is required for communication between the peered VPCs.
- Route tables must be updated to direct traffic through the peering connection.
- Security Groups and Network ACLs must allow the required traffic.

---

## Workflow

1. Configure the AWS provider.
2. Create VPC 1.
3. Create VPC 2.
4. Create subnets.
5. Create route tables.
6. Create the VPC Peering Connection.
7. Accept the peering connection (if required).
8. Add routes to both route tables.
9. Verify connectivity between the VPCs.

---

## Benefits of Using Terraform

- Infrastructure as Code (IaC)
- Reusable configurations
- Version control support
- Automated deployments
- Consistent infrastructure
- Easy rollback and updates

---

## Expected Output

After successful deployment, Terraform creates:

- Two VPCs
- One VPC Peering Connection
- Route table updates
- Connectivity between both VPCs

Terraform also displays output values such as:

- VPC IDs
- Peering Connection ID
- Route Table IDs
- Subnet IDs

---

## Learning Outcomes

Through this project, I learned:

- Creating AWS VPCs using Terraform
- Managing Terraform variables and outputs
- Configuring AWS providers
- Establishing VPC Peering Connections
- Updating route tables for private communication
- Managing infrastructure using Infrastructure as Code (IaC)

---

## Future Enhancements

- Cross-Account VPC Peering
- Cross-Region VPC Peering
- Private EC2 connectivity testing
- Transit Gateway implementation
- Automated testing with Terraform modules

---

## Author

**Name:** YALAMADDI DINESH

**Project:** AWS VPC Peering using Terraform
