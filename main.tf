module "server_lamp" {
  source          = "./modules/ec2"
  instance_name   = "Servidor Lamp"
  bash_file       = "install_lamp.sh"
  security_groups = [aws_security_group.sg_default_web.name]
  key_name        = var.ec2_key_name
}

output "server_lamp_ip" {
  value = module.server_lamp.public_ip
}

module "server_nginx" {
  source          = "./modules/ec2"
  instance_name   = "Servidor NGINX"
  bash_file       = "install_nginx.sh"
  security_groups = [aws_security_group.sg_default_web.name]
  key_name        = var.ec2_key_name
}

output "server_nginx_ip" {
  value = module.server_nginx.public_ip
}

module "bucket" {
  source      = "./modules/s3"
  bucket_name = "bucket-duda-e-thaina"
}

module "postgres_rds" {
  source          = "./modules/rds"
  db_user         = var.db_user
  db_password     = var.db_password
  security_groups = [aws_security_group.sg_default_rds.id]
}

output "postgres_endpoint" {
  value = module.postgres_rds.rds_endpoint
}
