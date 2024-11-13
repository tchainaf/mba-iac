# Criar a VPC
resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"
}

# Criar a sub-rede pública para os servidores
resource "aws_subnet" "public_subnet_servers" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
}

# Criar a sub-rede privada para o banco de dados
resource "aws_subnet" "private_subnet_rds" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = "10.0.2.0/24"
}

# Criar o Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id
}

# Criar a tabela de rotas
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

# Associar a sub-rede pública à tabela de rotas
resource "aws_route_table_association" "public_association" {
  subnet_id      = aws_subnet.public_subnet_servers.id
  route_table_id = aws_route_table.public_rt.id
}