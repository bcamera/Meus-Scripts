#!/bin/bash
echo "Atualizando"
apt-get update -y
apt-get dist-upgrade -y
echo ""
echo "Instalando Programas"
echo ""
#Para instalar virtual box remova o comentario da linha abaixo
#apt-get install virtualbox -y
apt-get install rar -y
apt-get install gnupg2 -y
apt-get install git -y
apt-get install g++ -y
apt-get install default-jdk -y
git config --global user.name "bcamera"
git config --global user.email bcamera@hotmail.com
echo ""
echo "Limpando"
echo ""
apt-get autoclean -y
apt-get autoremove -y


