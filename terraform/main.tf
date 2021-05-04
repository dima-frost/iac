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

resource "aws_security_group" "ssh-pyapp" {
  name        = "allow_ssh_pyapp"

  ingress {
    from_port        = 22
    to_port          = 9000
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh_pyapp"
  }
}
resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = aws_security_group.ssh-pyapp.id
  network_interface_id = aws_instance.final-project.primary_network_interface_id
}