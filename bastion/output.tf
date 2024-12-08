output "aws_instance_id" {
  value = aws_instance.main.id
}

output "primary_network_interface_id" {
  value = aws_network_interface.sandbox.id
}

output "associate_public_ip_address" {
  value = aws_instance.main.associate_public_ip_address
}