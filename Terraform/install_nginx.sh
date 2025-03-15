#!/bin/bash

echo "Atualizando o sistema..."
sudo apt update -y
sudo apt upgrade -y

echo "Instalando e iniciando o serviço NGINX..."
sudo apt install nginx -y
sudo systemctl enable nginx
sudo systemctl start nginx

if systemctl is-active --quiet nginx; then
  echo "NGINX está rodando!"
else
  echo "Houve um problema ao iniciar o NGINX."
  exit 1
fi