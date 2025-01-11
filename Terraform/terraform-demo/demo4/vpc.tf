resource "aws_vpc" "demo" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "demo-vpc"
  }
}

resource "aws_subnet" "demo-public-1" {
  vpc_id                  = aws_vpc.demo.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1
  tags = {
    Name = "demo-public-1"
  }
}

resource "aws_subnet" "demo-public-2" {
  vpc_id                  = aws_vpc.demo.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE2
  tags = {
    Name = "demo-public-2"
  }
}


resource "aws_subnet" "demo-public-3" {
  vpc_id                  = aws_vpc.demo.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE3
  tags = {
    Name = "demo-public-3"
  }
}


resource "aws_subnet" "demo-private-1" {
  vpc_id                  = aws_vpc.demo.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1
  tags = {
    Name = "demo-private-1"
  }
}


resource "aws_subnet" "demo-private-2" {
  vpc_id                  = aws_vpc.demo.id
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE2
  tags = {
    Name = "demo-private-2"
  }
}


resource "aws_subnet" "demo-private-3" {
  vpc_id                  = aws_vpc.demo.id
  cidr_block              = "10.0.6.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE3
  tags = {
    Name = "demo-private-3"
  }
}

resource "aws_internet_gateway" "demo-IGW" {
  vpc_id = aws_vpc.demo.id
  tags = {
    Name = "demo-IGW"
  }
}

resource "aws_route_table" "demo-public-RT" {
  vpc_id = aws_vpc.demo.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demo-IGW.id
  }

  tags = {
    Name = "demo-public-RT"
  }
}


resource "aws_route_table_association" "demo-public-1-a" {
  subnet_id      = aws_subnet.demo-public-1.id
  route_table_id = aws_route_table.demo-public-RT.id
}

resource "aws_route_table_association" "demo-public-2-a" {
  subnet_id      = aws_subnet.demo-public-2.id
  route_table_id = aws_route_table.demo-public-RT.id
}
resource "aws_route_table_association" "demo-public-3-a" {
  subnet_id      = aws_subnet.demo-public-3.id
  route_table_id = aws_route_table.demo-public-RT.id
}
