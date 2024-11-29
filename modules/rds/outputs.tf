output "rds_endpoint" {
  description = "Endpoint da instância RDS"
  value       = aws_db_instance.rds_instance.endpoint
}

output "rds_instance_id" {
  description = "ID da instância RDS"
  value       = aws_db_instance.rds_instance.id
}

output "rds_arn" {
  description = "ARN da instância RDS"
  value       = aws_db_instance.rds_instance.arn
}
