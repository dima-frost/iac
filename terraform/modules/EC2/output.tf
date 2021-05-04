output "ec2_endpoint" {
  description = "public ip EC2 instance"
  value       = aws_instance.final-project.public_ip
}