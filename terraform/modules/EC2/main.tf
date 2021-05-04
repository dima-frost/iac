resource "aws_instance" "final-project" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  tags = {
    Name = var.name
  }
}

