resource "aws_db_instance" "rds_instance" {
  allocated_storage   = var.allocated_storage
  engine              = var.engine
  engine_version      = var.engine_version
  instance_class      = var.instance_class
  username            = var.db_user
  password            = var.db_password
  skip_final_snapshot = true
  publicly_accessible = true

  db_subnet_group_name   = var.subnet_group_name
  vpc_security_group_ids = var.security_groups
}
