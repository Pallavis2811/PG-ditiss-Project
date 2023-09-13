terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = "AKIA4RF4HSJSQZ4QP2VU"
  secret_key = "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"
}


resource "aws_security_group" "W_sg" {
  name_prefix = "workgroup-"
  description = "Allow HTTP and SSH traffic via Terraform"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 3306
    to_port   = 3306
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "instances" {
  count = 3

  ami           = "ami-053b0d53c279acc90"  
  instance_type = "t2.micro"    
  key_name      = "server"
  security_groups = [aws_security_group.W_sg.name]

  tags = {
    Name = "server-${count.index + 1}"
  }
}
resource "aws_instance" "instances" {
  count = 2

  ami           = "ami-053b0d53c279acc90"  
  instance_type = "t2.medium"    
  key_name      = "server"
  security_groups = [aws_security_group.W_sg.name]

  tags = {
    Name = "server-${count.index + 1}"
  }
}
