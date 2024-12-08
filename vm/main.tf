
data "aws_vpc" "sandbox" {
  id = var.vpc_id
}

data "aws_subnet" "sandbox" {
  vpc_id = data.aws_vpc.sandbox.id
  id     = var.subnet_id
}

resource "aws_network_interface" "sandbox" {
  for_each = var.private_ips

  subnet_id       = data.aws_subnet.sandbox.id
  private_ips     = [each.value]
  security_groups = var.security_groups

  tags = {
    name = "primary_network_interface_${each.key}"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "main" {
  for_each = var.private_ips

  ami           = data.aws_ami.ubuntu.id
  instance_type = var.ec2_instance_type
  key_name      = var.key_pair_name

  network_interface {
    network_interface_id = aws_network_interface.sandbox[each.key].id
    device_index         = 0
  }

  root_block_device {
    volume_size = var.root_block_device_volume_size
  }

  user_data = <<-EOF
              #!/bin/bash
              echo "ubuntu:${var.admin_password}" | chpasswd
              EOF

  tags = {
    name = "HelloWorld_${each.key}"
    env  = var.tags["environment"]["env"]
  }
}
