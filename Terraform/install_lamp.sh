#!/bin/bash

echo "Atualizando o sistema..."
sudo apt update -y
sudo apt upgrade -y

echo "Instalando e iniciando o serviço Apache..."
sudo apt install apache2 -y
sudo systemctl enable apache2
sudo systemctl start apache2

echo "Instalando e configurando o MySQL..."
sudo apt install mysql-server -y
mysql_secure_installation <<EOF

y
rootpassword
rootpassword
y
y
y
y
EOF

echo "Instalando PHP e módulos necessários..."
sudo apt install php libapache2-mod-php php-mysql php-cli php-curl php-json php-mbstring php-xml -y

echo "Configurando Apache para priorizar arquivos PHP..."
cat <<EOL > /etc/apache2/mods-enabled/dir.conf
<IfModule mod_dir.c>
    DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm
</IfModule>
EOL
sudo systemctl restart apache2

echo "LAMP stack instalada com sucesso!"