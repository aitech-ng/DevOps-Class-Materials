#!/bin/bash

sudo apt update

sudo apt install openjdk-17-jdk

wget https://downloads.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz

tar -xvf apache-maven-3.9.6-bin.tar.gz

sudo ln -s /opt/apache-maven-3.9.6 /opt/maven

sudo echo 'export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64' >> /etc/profile.d/maven.sh

sudo echo 'export M2_HOME=/opt/maven' >> /etc/profile.d/maven.sh

sudo echo 'export MAVEN_HOME=/opt/maven' >> /etc/profile.d/maven.sh

sudo echo 'export PATH=${M2_HOME}/bin:${PATH}' >> /etc/profile.d/maven.sh

sudo chmod +x /etc/profile.d/maven.sh

source /etc/profile.d/maven.sh

git clone https://github.com/GerromeSieger/RecipeApp-Java.git

cd RecipeApp-Java

mvn clean install

mvn spring-boot:run