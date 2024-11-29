variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "aws_access_key" {
  description = "AWS Access Key"
  type        = string
  sensitive   = true
}

variable "aws_secret_key" {
  description = "AWS Secret Key"
  type        = string
  sensitive   = true
}

variable "aws_session_token" {
  description = "AWS Session Token"
  type        = string
  sensitive   = true
}

variable "db_user" {
  description = "Usuário administrador do banco de dados"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Senha do usuário administrador do banco de dados"
  type        = string
  sensitive   = true
}

variable "ec2_key_name" {
  description = "Nome da chave SSH para acessar a instância EC2"
  type        = string
}
