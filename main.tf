# Variables definition
variable "ami" {
  description = "The AMI to use for the instance"
  type        = string
}

variable "region" {
  description = "The AWS region to deploy the instance"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to use"
  type        = string
}

variable "access_key" {
  description = "AWS Access Key"
  type        = string
  sensitive   = true
}

variable "secret_key" {
  description = "AWS Secret Key"
  type        = string
  sensitive   = true
}

variable "subnet_id" {
  description = "The ID of the subnet in which to launch the instance"
  type        = string
}

# AWS EC2 instance resource
resource "aws_instance" "terraform_cloud_demo_server" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  tags = {
    Name = "cloud-demo-server"
  }
}

# Outputs (optional)
output "instance_id" {
  description = "The ID of the created instance"
  value       = aws_instance.terraform_cloud_demo_server.id
}
