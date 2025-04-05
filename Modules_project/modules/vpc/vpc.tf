# VPC
resource "aws_vpc" "myvpc" {
  cidr_block       = var.cidr_vpc

  tags = {
    Name = "vpc"
  }
}

# Subnets
# Public_subnet_1
resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.pub_sub_1
  availability_zone = var.az_pub_1
  tags = {
    Name = "Public_subnet_1"
  }
}

#Public_subnet_2
resource "aws_subnet" "public_subnet_2" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.pub_sub_2
  availability_zone = var.az_pub_2
  tags = {
    Name = "Public_subnet_2"
  }
}

# Private_subnet_1
resource "aws_subnet" "private_subnet_1" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.pvt_sub_1
  availability_zone = var.az_pvt_1
  tags = {
    Name = "Private_subnet_1"
  }
}

# Private_subnet_2
resource "aws_subnet" "private_subnet_2" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.pvt_sub_2
  availability_zone = var.az_pvt_2
  tags = {
    Name = "Private_subnet_2"
  }
}

# Internet GW
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "Internet-gateway"
  }
}


# Eip
resource "aws_eip" "myeip1" {
  vpc = true
}

# 2nd EIP
resource "aws_eip" "myeip2" {
 vpc = true
}


# Nat GW
resource "aws_nat_gateway" "nat_1" {
  allocation_id = aws_eip.myeip1.id
  subnet_id     = aws_subnet.public_subnet_1.id

  tags = {
    Name = "gw_NAT_1"
  }
}

# 2nd Nat Gw
resource "aws_nat_gateway" "nat_2" {
  allocation_id = aws_eip.myeip2.id
  subnet_id     = aws_subnet.public_subnet_2.id

  tags = {
    Name = "gw_NAT_2"
  }
}

# Rt
# Public RT 1
resource "aws_route_table" "public_rt_1" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public_rt1"
  }
}

# Public RT 2
resource "aws_route_table" "public_rt_2" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public_rt2"
  }
}

# Private RT 1
resource "aws_route_table" "private_rt_1" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_1.id
  }

  tags = {
    Name = "private_rt1"
  }
}

# Private RT 2
resource "aws_route_table" "private_rt_2" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_2.id
  }

  tags = {
    Name = "private_rt2"
  }
}


# RT_ass
# Public_rt_ass_1
resource "aws_route_table_association" "public_rt_ass1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_rt_1.id
}

# Public_rt_ass_2
resource "aws_route_table_association" "public_rt_ass2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_rt_2.id
}

# Private_rt_ass_1
resource "aws_route_table_association" "private_rt_ass1" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_rt_1.id
}

# Private_rt_ass_2
resource "aws_route_table_association" "private_rt_ass2" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_rt_2.id
}


# Sg

# Public sg
resource "aws_security_group" "public_sg" {
  name        = "allow_ssh_http"
  vpc_id      = aws_vpc.myvpc.id

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

    ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

# Private Sg

# Public sg
resource "aws_security_group" "private_sg" {
  name        = "allow_ssh_http_mysql"
  vpc_id      = aws_vpc.myvpc.id

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

    ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

    ingress {
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls_mysql"
  }
}