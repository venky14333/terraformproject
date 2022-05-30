resource "aws_vpc" "main" {
  cidr_block       = "192.168.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "green-vpc"
  }
}
resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "192.168.10.0/24"

  tags = {
    Name = "green-subnet1"
  }
}
resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "192.168.11.0/24"

  tags = {
    Name = "green-subnet2"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "greenigw"
  }
}

resource "aws_default_route_table" "green-rtb" {
  default_route_table_id = aws_vpc.green-rtb.default_route_table_id

  route {
    cidr_block = "192.168.0.0/16"
    gateway_id = aws_internet_gateway.green-rtb.id
  }

  route {
    ipv6_cidr_block        = "::/0"
    egress_only_gateway_id = aws_egress_only_internet_gateway.green-rtb.id
  }

  tags = {
    Name = "green-routetable"
  }
}

resource "aws_internet_gateway_attachment" "igwattach" {
  internet_gateway_id = aws_internet_gateway.igw.id
  vpc_id              = aws_vpc.main.id
}

