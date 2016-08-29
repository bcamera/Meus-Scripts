#!/bin/bash
tar -xvzf Zabbix.tar.gz 
cd Zabbxix-Server/etc
sudo cp -Ri mysql/ /etc/
sudo cp -Ri php5/ /etc/
sudo cp -Ri apache2/sites-available/zabbix.conf /etc/apache2/sites-available/zabbix.conf
sudo cp -Ri zabbix/ /etc/
cd ..
cd usr
sudo cp -Ri mysql/ /usr/
sudo cp -Ri php5/ /usr/
sudo cp -Ri zabbix/ /usr/
