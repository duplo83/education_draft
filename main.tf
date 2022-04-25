terraform {
  required_version = ">= 0.14.9" 
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Declare variables.
variable "aws_region" {
  description = "Region in which AWS resources to be created"
  type        = string
  default     = "us-east-1" #AWS region. Update the value to your desired AWS region.
}

variable "ec2_ami_id" {
  description = "AMI ID your EC2 instance will be created with"
  type        = string
  default     = "ami-03ededff12e34e59e" #Amazon2 Linux AMI ID. Update value to your desired AMI ID.
}

# Provider Block
provider "aws" {
  region  = var.aws_region
  profile = "default"
}

# Create Security Group resource
resource "aws_security_group" "dev-vpc-sg" {
  name        = "test-learn-sg"
  description = "Learn tutorial Security Group"
  
ingress {
    description = "Allow all IP and Ports Inbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all IP and Ports Outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create EC2 Instance
resource "aws_instance" "example_learn_instance" {
  ami                    = var.ec2_ami_id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.dev-vpc-sg.id]
  #subnet_id = "id of subnet where TFE instance resides"
  user_data = file("prometheus-install.sh")
  tags = {
    "Name" = "example_learn_instance"
  }    
}

# The IP address of your test EC2 instance will be display in this output after the Terraform apply command completes.
 output "public_ip" {
   description = "Access your prometheus dashboard over port 9090, and Grafana dashboard over port 3000."
   value       = aws_instance.example_learn_instance.public_ip
}



