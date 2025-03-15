1. Criar conta no [Pulumi](https://www.pulumi.com), pode ser com o GitHub
2. Clicar no seu avatar e depois em Personal Access Tokens
3. Criar um token (pode ser sem data de expiração) e salvar o token gerado
4. [Instalar o Pulumi](https://www.pulumi.com/docs/iac/download-install/)
5. Na AWS, criar um usuário IAM com direito de admin e baixar o arquivo com as credenciais
6. [Configurar as chaves de acesso da AWS no Pulumi](https://www.pulumi.com/docs/iac/get-started/aws/begin/)
7. [Criar um projeto Pulumi](https://www.pulumi.com/docs/iac/get-started/aws/create-project/) - será necessário informar o token do passo 3
```
mkdir quickstart && cd quickstart && pulumi new aws-python
```
8. Seguir os passos de Review project e Deploy stack
```
pulumi up
pulumi stack output bucket_name
```
