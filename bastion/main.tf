
data "aws_vpc" "sandbox" {
  id = var.vpc_id
}

data "aws_subnet" "sandbox" {
  vpc_id = data.aws_vpc.sandbox.id
  id     = var.subnet_id
}

resource "aws_network_interface" "sandbox" {
  subnet_id   = data.aws_subnet.sandbox.id
  private_ips = var.network_interface_private_ips

  tags = {
    name = "primary_network_interface"
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
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.ec2_instance_type
  key_name      = var.key_pair_name
  security_groups = var.security_groups

  network_interface {
    network_interface_id = aws_network_interface.sandbox.id
    device_index         = 0
  }

  root_block_device {
    volume_size = var.root_block_device_volume_size
  }

  tags = {
    name = "HelloWorld"
    env  = var.tags["environment"]["env"]
  }
}
