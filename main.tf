provider "aws" {
  region = "us-east-1"
}

# VPC
resource "aws_vpc" "actividad3_vpc" {
<<<<<<< HEAD
  cidr_block           = "10.10.0.0/20"
=======
  cidr_block           = "10.10.0.0/20" #IP del diagrama
>>>>>>> 3795fada46dd5f065ad0ab9b16e6d4e03c7bccee
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "actividad3-vpc"
  }
}

# Subred publica
resource "aws_subnet" "actividad3_subred_publica" {
  vpc_id                  = aws_vpc.actividad3_vpc.id
<<<<<<< HEAD
  cidr_block              = "10.10.0.0/24"
=======
  cidr_block              = "10.10.0.0/24" #IP del diagrama
>>>>>>> 3795fada46dd5f065ad0ab9b16e6d4e03c7bccee
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

#Creacion grupo de seguridad para Jump Server
resource "aws_security_group" "actividad3_sg_jump" {
  name        = "actividad3_sg_jump"
  description = "Permite conexion por ssh"
  vpc_id      = aws_vpc.actividad3_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # todo el internet
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "actividad3-sg-jump"
  }
}
#Creacion de grupo de seguridad Web server
resource "aws_security_group" "actividad3_sg_web" {
  name        = "actividad3_sg_web"
  description = "Permite trafico de http desde internet y ssh desde Jump Server"
  vpc_id      = aws_vpc.actividad3_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.actividad3_sg_jump.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "actividad3-sg-web"
  }
}
<<<<<<< HEAD


=======
>>>>>>> 3795fada46dd5f065ad0ab9b16e6d4e03c7bccee
#Creacion de instancias
# jump Server
resource "aws_instance" "actividad3_jump" {
  ami                    = "ami-053b0d53c279acc90"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.actividad3_subred_publica.id
  vpc_security_group_ids = [aws_security_group.actividad3_sg_jump.id]
  key_name               = "vockey"

  tags = {
    Name = "actividad3-jump"
  }
}

#instancia WS 1
resource "aws_instance" "actividad3_web1" {
  ami                    = "ami-053b0d53c279acc90"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.actividad3_subred_publica.id
  vpc_security_group_ids = [aws_security_group.actividad3_sg_web.id]
  key_name               = "vockey"

  tags = {
    Name = "actividad3-web1"
  }
}

#instancia WS 2
resource "aws_instance" "actividad3_web2" {
  ami                    = "ami-053b0d53c279acc90"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.actividad3_subred_publica.id
  vpc_security_group_ids = [aws_security_group.actividad3_sg_web.id]
  key_name               = "vockey"

  tags = {
    Name = "actividad3-web2"
  }
}

#instancia WS 3
resource "aws_instance" "actividad3_web3" {
  ami                    = "ami-053b0d53c279acc90"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.actividad3_subred_publica.id
  vpc_security_group_ids = [aws_security_group.actividad3_sg_web.id]
  key_name               = "vockey"

  tags = {
    Name = "actividad3-web3"
  }
<<<<<<< HEAD
}

=======
}
>>>>>>> 3795fada46dd5f065ad0ab9b16e6d4e03c7bccee
