variable "ami" {
  description = "EC2 AMI default"
  type        = string
  default     = "ami-0866a3c8686eaeeba"
}

variable "instance_type" {
  description = "EC2 instance default"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Nome da chave SSH para acessar a instância"
  type        = string
}

variable "instance_name" {
  description = "Nome da instância EC2"
  type        = string
  default     = "Meu servidor"
}

variable "public_subnet_id" {
  description = "ID da sub-rede pública"
  type        = string
  default     = ""
}

variable "security_groups" {
  description = "Lista de grupos de segurança"
  type        = list(string)
}

variable "bash_file" {
  description = "Nome do arquivo de instalação que será executado"
  type        = string
  default     = "update.sh"
}

variable "vpc_id" {
  description = "ID da rede"
  type        = string
  default     = ""
}
