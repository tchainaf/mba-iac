variable "db_user" {
  description = "Usuário administrador do banco de dados"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Senha do usuário administrador"
  type        = string
  sensitive   = true
}

variable "engine" {
  description = "Engine do banco de dados (ex: mysql, postgres)"
  type        = string
  default     = "postgres"
}

variable "engine_version" {
  description = "Versão da engine do banco de dados"
  type        = string
  default     = 14
}

variable "instance_class" {
  description = "Classe da instância RDS"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "Armazenamento alocado para a instância RDS (em GB)"
  type        = number
  default     = 20
}

variable "subnet_group_name" {
  description = "Nome do grupo de sub-rede"
  type        = string
  default     = ""
}

variable "security_groups" {
  description = "Lista de grupos de segurança"
  type        = list(string)
}
