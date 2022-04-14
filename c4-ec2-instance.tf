# Resource-8: Create EC2 Instance
resource "aws_instance" "dane-ec2-vm" {
  ami                    = var.ec2_ami_id # Amazon Linux
  instance_type          = "t2.micro"
  count                  = var.ec2_instance_count
  vpc_security_group_ids = [aws_security_group.dev-vpc-sg.id]
  user_data = file("prometheus-install.sh")
  tags = {
    "Name" = "daneec2vm"
  }    
}

# output "public_ip" {
#   description = "Access your prometheus dashboard over port 9090, and Grafana dashboard over port 3000."
#   value       = aws_eip.my-eip.public_ip
# }



