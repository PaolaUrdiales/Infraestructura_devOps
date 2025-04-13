provider "aws" {
  region = "us-east-1"
}

# VPC
resource "aws_vpc" "actividad3_vpc" {
  cidr_block           = "10.10.0.0/20" #IP del diagrama
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "actividad3-vpc"
  }
}

# Subred publica
resource "aws_subnet" "actividad3_subred_publica" {
  vpc_id                  = aws_vpc.actividad3_vpc.id
  cidr_block              = "10.10.0.0/24" #IP del diagrama
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "actividad3-subred-publica"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "actividad3_igw" {
  vpc_id = aws_vpc.actividad3_vpc.id

  tags = {
    Name = "actividad3-igw"
  }
}

# Tabla de rutas
resource "aws_route_table" "actividad3_publica" {
  vpc_id = aws_vpc.actividad3_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.actividad3_igw.id
  }
}

# Asociacion de la tabla de rutas
resource "aws_route_table_association" "actividad3_asociacion_subred" {
  subnet_id      = aws_subnet.actividad3_subred_publica.id
  route_table_id = aws_route_table.actividad3_publica.id
}
