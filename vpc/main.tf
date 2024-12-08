
resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = var.instance_tenancy

  tags = {
    name = "vpc"
    env  = var.tags["environment"]["env"]
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cidr_block

  tags = {
    name = "subnet"
    env  = var.tags["environment"]["env"]
  }

  depends_on = [aws_vpc.main]
}

resource "aws_internet_gateway" "igw_main" {
  vpc_id = aws_vpc.main.id

  tags = {
    name = "internet_gateway"
    env  = var.tags["environment"]["env"]
  }

  depends_on = [aws_vpc.main]
}

# resource "aws_internet_gateway_attachment" "main" {
#   internet_gateway_id = aws_internet_gateway.igw_main.id
#   vpc_id              = aws_vpc.main.id
# }