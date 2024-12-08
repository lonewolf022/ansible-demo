output "aws_instance_id" {
  value = { for k, v in aws_instance.main : k => v.id }
}

output "primary_network_interface_id" {
  value = { for k, v in aws_network_interface.sandbox : k => v.id }
}

output "associate_public_ip_address" {
  value = { for k, v in aws_instance.main : k => v.associate_public_ip_address }
}