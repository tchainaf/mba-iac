# Atividade MBA - IaC

Atividade avaliativa da matéria de Cloud Infrastructure as Code do curso MBA em DevOps e Cloud Computing da Universidade Mackenzie.

O código Terraform descreve uma solução de infraestrutura as code (IaC) para a topologia descrita na imagem abaixo na AWS
![image](https://github.com/user-attachments/assets/cfccc0a8-d814-49a3-9de5-9d3677e9db1a)


## Pré-requisitos

1. Instale o Terraform conforme instruções do [site oficial](https://developer.hashicorp.com/terraform/install).

2. Configure as credenciais de acesso da AWS criando o arquivo `terraform.vars` na raiz do projeto:
    ```
    aws_access_key    = "" # Chave de acesso da AWS
    aws_secret_key    = "" # Chave secreta da AWS
    aws_session_token = "" # Token de sessão da AWS
    ```

## Instalação

1. Clone este repositório
    ```
    git clone https://github.com/tchainaf/mba-iac.git
    cd mba-iac
    ```

2. Adicione as variáveis para criação dos recursos AWS no arquivo `terraform.vars`:
    ```
    db_user           = "" # Usuário administrador do banco de dados RDS
    db_password       = "" # Senha do usuário administrador do banco de dados RDS
    ec2_key_name      = "" # Nome da chave SSH para as instâncias EC2
    ```

3. Execute o comando Terraform para inicializar o diretório de trabalho:
    ```
    terraform init
    ```
4. Execute o comando Terraform para criar o plano de execução:
    ```
    terraform plan
    ```
5. Execute o comando Terraform para provisionar os recursos na AWS:
    ```
    terraform apply
    ```