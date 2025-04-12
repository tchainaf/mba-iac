# Criação de role Apache

> Os passos abaixo foram feitos baseados no passo a passo do professor de [criação de role apache](https://github.com/mvm-sp/iac-devops/blob/74dab8493e0ac3a4ebfcfc6e4c17f4c32c11888d/06%20-%20Ansible-Galaxy/labs/01-lab.md).

1. Conecte-se no SERVIDOR PRINCIPAL e inicie um projeto do Ansible Galaxy
```
# Caso a pasta abaixo não exista, crie usando `sudo mkdir`
cd /etc/ansible/roles

sudo ansible-galaxy init ./apache --offline
```

2. Execute o comando `tree` e compare com a estrutura abaixo
```
.
└── apache
    ├── README.md
    ├── defaults
    │   └── main.yml
    ├── files
    ├── handlers
    │   └── main.yml
    ├── meta
    │   └── main.yml
    ├── tasks
    │   └── main.yml
    ├── templates
    ├── tests
    │   ├── inventory
    │   └── test.yml
    └── vars
        └── main.yml
```

3. Crie os arquivos abaixo dentro da pasta `apache/tasks`

> Arquivo install.yml
```
- name: Install http Package
  package:
    name: apache2
    state: present
```

> Arquivo configure.yml
```
- name: Copy httpd configuration file
  copy: src=files/apache2.conf dest=/etc/apache2/apache2.conf
- name: Copy index.html file
  copy: src=files/index.html dest=/var/www/html/index.html
  notify:
  - restart apache
```

> Arquivo start.yml
```
- name: Start and enable httpd service
  service: name=apache2 state=restarted enabled=yes
```

> Arquivo main.yml
```
---
# tasks file for ./apache

- import_tasks: install.yml
- import_tasks: configure.yml
- import_tasks: start.yml
```

4. Altere o arquivo `apache/handlers/main.yml` conforme o conteúdo abaixo:
```
---
# handlers file for ./apache
- name: restart apache
  service: name=apache2 state=restarted
```

5. Crie o arquivo `apache2.conf` que será usado na configuração
```
cd apache/files
sudo vim apache2.conf

# Cole o conteúdo do arquivo que está na pasta raiz desse repositório e salve o arquivo
```

6. Copie o arquivo `index.html` usado nas aulas anteriores para a pasta apache
```
sudo cp ~/files/index.html index.html
```

7. Preencha o seu nome e a descrição no arquivo `meta/main.yml`
```
cd ../meta
sudo vim main.yml
```

8. Execute o comando `tree` na pasta apache e compare com a estrutura abaixo
```
.
├── README.md
├── defaults
│   └── main.yml
├── files
│   ├── apache2.conf
│   └── index.html
├── handlers
│   └── main.yml
├── meta
│   └── main.yml
├── tasks
│   ├── configure.yml
│   ├── install.yml
│   ├── main.yml
│   └── start.yml
├── templates
├── tests
│   ├── inventory
│   └── test.yml
└── vars
    └── main.yml
```

9. Crie um novo playbook executando a role que criamos acima
```
cd ~/files
vim apache_role.yml
# Cole o conteúdo do arquivo que está na pasta playbooks desse repositório e salve o arquivo
```

10. Crie uma EC2 (SERVIDOR APACHE), com imagem **Ubuntu**, a Key Pair e o security group já existentes e adicione o IP público dela no arquivo `~/files/hosts`
```
[webservers]
44.201.235.21
```

11. Copie a chave SSH do SERVIDOR PRINCIPAL
```
# Copie o retorno do comando abaixo
cat ~/.ssh/id_rsa.pub
```

12. Conecte-se no SERVIDOR APACHE via SSH e cadastre a chave SSH do SERVIDOR PRINCIPAL
```
vim ~/.ssh/authorized_keys
# Cole em uma nova linha o conteúdo copiado no passo anterior e salve o arquivo
```

13. No SERVIDOR PRINCIPAL, atualize o servidor apache remotamente e execute o playbook
```
ansible -i hosts -m shell -a 'apt update -y' webservers --become
ansible -i hosts -m shell -a 'apt upgrade -y' webservers --become

ansible-playbook -i hosts apache_role.yml --become
```

14. Para visualizar a página inicial do SERVIDOR APACHE, acesse o IP público dele através de um navegador


# Criação de role NGINX

> Os passos abaixo foram feitos como resposta do exercício de [criação de role NGINX](https://github.com/mvm-sp/iac-devops/blob/74dab8493e0ac3a4ebfcfc6e4c17f4c32c11888d/06%20-%20Ansible-Galaxy/labs/02-lab.md).

1. No SERVIDOR PRINCIPAL, vamos iniciar um novo role
```
cd /etc/ansible/roles
sudo ansible-galaxy init ./nginx --offline
cd nginx/tasks
```

2. Crie o arquivo `pretask.yml`
```
- name: install python 3
  become: true
  become_user: root
  raw: test -e /usr/bin/python3 || (apt -y update && apt install -y python3)

- name: Update and upgrade apt packages
  become: true
  apt:
    upgrade: yes
    update_cache: yes
    cache_valid_time: 86400 #One day
```

3. Crie o arquivo `install.yml`
```
- name: Install NGINX
  package:
    name: nginx
    state: present
```

4. Crie o arquivo `configure.yml`
```
- name: Copy index.html file
  copy: src=files/index.html dest=/var/www/html/index.nginx-debian.html
  notify:
  - restart nginx
```

5. Crie o arquivo `start.yml`
```
- name: Start and enable NGINX service
  service: name=nginx state=restarted enabled=yes
```

6. Altere o arquivo `main.yml`
```
---
# tasks file for ./nginx
- import_tasks: pretask.yml
- import_tasks: install.yml
- import_tasks: configure.yml
- import_tasks: start.yml
```

7. Copie o arquivo `index.html` usado nas aulas anteriores para a pasta nginx
```
cd ..
sudo cp ~/files/index.html files/index.html

cd handlers
```

8. Altere o arquivo `handlers/main.yml`
```
---
# handlers file for ./nginx
- name: restart nginx
  service: name=nginx state=restarted
```

9. Preencha o seu nome e a descrição no arquivo `meta/main.yml`
```
cd ../meta
sudo vim main.yml
```

10. Crie um novo playbook executando a role que criamos acima
```
cd ~/files
vim nginx_role.yml
# Cole o conteúdo do arquivo que está na pasta playbooks desse repositório e salve o arquivo
```

11. Crie uma EC2 (SERVIDOR NGINX), com imagem **Ubuntu**, a Key Pair e o security group já existentes e adicione o IP público dela no arquivo `~/files/hosts`
```
[nginx_server]
3.85.119.199
```

12. Copie a chave SSH do SERVIDOR PRINCIPAL
```
# Copie o retorno do comando abaixo
cat ~/.ssh/id_rsa.pub
```

13. Conecte-se no SERVIDOR NGINX via SSH e cadastre a chave SSH do SERVIDOR PRINCIPAL
```
vim ~/.ssh/authorized_keys
# Cole em uma nova linha o conteúdo copiado no passo anterior e salve o arquivo
```

14. No SERVIDOR PRINCIPAL, execute o playbook
```
ansible-playbook -i hosts nginx_role.yml --become
```

15. Para visualizar a página inicial do SERVIDOR NGINX, acesse o IP público dele através de um navegador