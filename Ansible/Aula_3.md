# Criação de playbook para servidor web

1. Conecte-se no SERVIDOR PRINCIPAL e crie um playbook para instalar o NGINX na EC2 da aula anterior
```
cd files
vim nginx_server.yml

# Cole o conteúdo do arquivo que está na pasta playbook desse repositório e salve o arquivo
```

2. Crie um arquivo `index.html` com o conteúdo abaixo
```
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>P&aacute;gina de teste de Ansible POS Mack</h1>
<p>Esta p&aacute;gina foi constru&iacute;da para o lab03 do curso de IaC no m&oacute;dulo de Ansible</p>
</body>
</html>
```

3. Execute o playbook criado
```
ansible-playbook nginx_server.yml -i hosts
```

4. Para visualizar a página inicial do servidor criado, acesse o IP público da EC2 através de um navegador

5. Crie um playbook para excluir a instância EC2, ajustando o valor de `region`
```
vim destroy.yml
# Cole o conteúdo do arquivo que está na pasta playbook desse repositório e salve o arquivo
```

6. Execute o playbook criado
```
ansible-playbook destroy.yml -i hosts
```