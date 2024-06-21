# Deploy a Java/Spring Boot REST API on Ubuntu 24

This guide outlines the steps to deploy a Java/Spring Boot REST API on an Ubuntu 24 server.

## 1. Update System Packages

sudo apt update

## 2. Install OpenJDK 17

sudo apt install openjdk-17-jdk -y

## 3. Install Maven

wget https://downloads.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz

tar -xvf apache-maven-3.9.6-bin.tar.gz

sudo mv apache-maven-3.9.6 /opt/maven

sudo nano /etc/profile.d/maven.sh

### Add the following content:

export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64

export M2_HOME=/opt/maven

export MAVEN_HOME=/opt/maven

export PATH=${M2_HOME}/bin:${PATH}

### Save and exit, then:

sudo chmod +x /etc/profile.d/maven.sh

source /etc/profile.d/maven.sh

## 4. Clone the Project

git clone https://github.com/GerromeSieger/RecipeApp-Java.git

cd RecipeApp-Java

## 5. Build the Project

mvn clean install

## 6. Configure Database

### Ensure your database connection is properly configured in application.properties or application.yml

## 7. Run the Application

mvn spring-boot:run

## 8. Set Up as a Systemd Service (Optional)

### Create a service file:

sudo nano /etc/systemd/system/springboot-api.service

### Add the following content (adjust paths as necessary):

```ini
[Unit]
Description=Spring Boot API
After=syslog.target

[Service]
User=ubuntu
ExecStart=/usr/bin/java -jar /path/to/your-application.jar
SuccessExitStatus=143

[Install]
WantedBy=multi-user.target