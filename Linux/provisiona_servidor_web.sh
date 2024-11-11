#!/bin/bash

# Atualizando o sistema e instalando o Apache
echo "Atualizando o sistema e instalando o Apache..."
sudo apt update -y
sudo apt upgrade -y
sudo apt install apache2 -y

# Habilitando o serviço Apache para iniciar automaticamente
echo "Habilitando o Apache para iniciar com o sistema..."
sudo systemctl enable apache2

# Iniciando o serviço Apache
echo "Iniciando o serviço Apache..."
sudo systemctl start apache2

# Configurando o firewall para permitir o tráfego HTTP e HTTPS
echo "Configurando o firewall para permitir tráfego HTTP e HTTPS..."
sudo ufw allow 'Apache Full'

# Criando uma página HTML simples de boas-vindas
echo "Configurando a página inicial..."
echo "<!DOCTYPE html>
<html>
<head>
    <title>Bem-vindo ao Servidor Web</title>
</head>
<body>
    <h1>Instalação Automática de Servidor Web Apache!</h1>
    <p>Este servidor foi provisionado automaticamente.</p>
</body>
</html>" | sudo tee /var/www/html/index.html

# Reiniciando o Apache para aplicar qualquer alteração
echo "Reiniciando o Apache..."
sudo systemctl restart apache2

echo "Servidor Web Apache configurado com sucesso e pronto para uso!"
