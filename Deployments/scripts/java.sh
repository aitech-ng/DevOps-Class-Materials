#!/bin/bash

sudo apt update

sudo apt install openjdk-17-jdk

wget https://mirrors.estointernet.in/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz

tar -xvf apache-maven-3.6.3-bin.tar.gz

mv apache-maven-3.6.3 /opt/

export M2_HOME='/opt/apache-maven-3.6.3'

export PATH="$M2_HOME/bin:$PATH"

git clone https://github.com/GerromeSieger/RecipeApp-Java.git

cd RecipeApp-Java

mvn clean install

mvn spring-boot:run