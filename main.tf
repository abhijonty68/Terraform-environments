provider "aws" {
  region = var.region
}

resource "aws_instance" "app" {
  ami           = var.ami  # Replace with a valid AMI ID
  instance_type = var.instance_type
  tags = {
    Name = var.app_name
  }
}
