resource "aws_instance" "ec2_instance" {
  ami             = var.ami
  instance_type   = var.instance_type
  subnet_id       = var.public_subnet_id
  security_groups = var.security_groups
  key_name        = var.key_name
  user_data       = file(var.bash_file)
  tags = {
    Name = var.instance_name
  }
}
