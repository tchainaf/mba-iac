# Criar o Security Group para o banco de dados RDS
resource "aws_security_group" "sg_rds" {
  vpc_id = aws_vpc.main_vpc.id

  # Permitir tráfego PostgreSQL apenas da sub-rede pública (instância EC2)
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.0.1.0/24"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Criar a instância RDS
resource "aws_db_instance" "rds_postgres" {
  allocated_storage    = 20
  engine               = "postgres"
  engine_version       = "14"
  instance_class       = "db.t2.micro"
  username             = "admin"
  password             = "admin123"
  #parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true

  # Conectar a instância RDS à sub-rede privada
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.sg_rds.id]

  tags = {
    Name = "RDS PostgreSQL"
  }
}

# Criar o grupo de sub-redes para o RDS
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = [aws_subnet.private_subnet.id]
}

# Output do endpoint da instância RDS
output "rds_endpoint" {
  value = aws_db_instance.rds_postgres.endpoint
}