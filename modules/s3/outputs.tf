output "bucket_id" {
  description = "Nome do bucket S3"
  value       = aws_s3_bucket.bucket.id
}

output "bucket_arn" {
  description = "ARN do bucket S3"
  value       = aws_s3_bucket.bucket.arn
}
