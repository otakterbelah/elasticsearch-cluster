#!/bin/bash
#script install elastic search
#update os
sudo apt-get update
apt-get upgrade
apt-get install gnupg
#install java
sudo apt-get install default-jre -y
printf "\n\n===========install java!===========\n\n"
#cek java version
java -version
"\n\n===========java version===========\n\n"
#import GPG-Key Elastic Stack
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
printf "\n\n===========Success Import GPG-Key!===========\n\n"
#install http transport
sudo apt-get install apt-transport-https -y
printf "\n\n===========Success https transport===========\n\n"
#input repo Elastic Stack 
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-7.x.list
printf "\n\n===========Success repo add===========\n\n"
#update dan install kibana 
sudo apt-get update && sudo apt-get install logstash -y
printf "\n\n===========Success install kibana ===========\n\n"
