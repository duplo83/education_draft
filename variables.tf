# Declare variables.
variable "aws_region" {
  description = "Region in which AWS resources to be created"
  type        = string
}

# variable "aws_availability_zone" {
#   description = "Availability zone where aws will be created"
#   type        = string
# }

variable "ec2_ami_id" {
  description = "AMI ID your EC2 instance will be created with"
  type        = string
}

variable "tfe_tag_name" {
  description = "Tag name for TFE instance"
  type        = string
}

# variable "vpc_id" {
# description = "VPC ID of existing TFE instance"
# type        = string
# }

variable "subnet_id" {
description = "Subnet of existing TFE instance"
type        = string
}

# variable "vpc_cidr_block"{
#   description = "Cidr block of existing TFE instance"
#   type        = string
# }

# variable "subnet_cidr_block"{
#   description = "Cidr block of existing subnet"
#   type        = string
# }

