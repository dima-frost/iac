terraform {
  backend "remote" {
    organization = "dimafrost"

    workspaces {
      name = "finalProject"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "final-project" {
  ami = "ami-013f17f36f8b1fefb"
  instance_type = "t2.micro"
  key_name = "itea"
  tags = {
    Name = "final-project"
  }
}

output "ec2_endpoint" {
  description = "public ip EC2 instance"
  value       = aws_instance.final-project.public_ip
}