resource "aws_security_group" "sg_server_02" {
  vpc_id = aws_vpc.main_vpc.id

  # Permitir tráfego SSH (porta 22)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Permitir tráfego web (porta 80)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Permitir todo o tráfego de saída
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Criar a instância EC2
resource "aws_instance" "ec2_server_02" {
  ami           = "ami-0866a3c8686eaeeba" 
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet.id
  security_groups = [aws_security_group.sg_server_02.name]

  #TODO: instalar NGINX
  tags = {
    Name = "Server02"
  }
}

# Output do IP público da instância EC2
output "ec2_public_ip" {
  value = aws_instance.ec2_server_02.public_ip
}