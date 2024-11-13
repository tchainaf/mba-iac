# Criação de um bucket S3
resource "aws_s3_bucket" "bucket_tf" {
  bucket = "bucket-mba-iac-projeto1"
  acl = "private"

  versioning {
    enabled = true
  }

  tags = {
    Name = "Bucket S3"
  }
}

# Política de bloqueio de acesso público (opcional)
resource "aws_s3_bucket_public_access_block" "bucket_tf_block" {
  bucket = aws_s3_bucket.bucket_tf.id

  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls  = true
  restrict_public_buckets = true
}