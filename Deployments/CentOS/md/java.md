# Deploy a Java/Spring Boot REST API on CentOS

This guide outlines the steps to deploy a Java/Spring Boot REST API on a CentOS server.

## 1. Update System Packages

sudo yum update -y

## 2. Install OpenJDK, Git, and Maven

sudo yum install java-17-openjdk-devel git maven -y

## 3. Clone the Project

git clone https://github.com/GerromeSieger/RecipeApp-Java.git

cd RecipeApp-Java

## 4. Build the Project

mvn clean install

## 5. Configure Database

### Ensure your database connection is properly configured in application.properties or application.yml

## 6. Run the Application

mvn spring-boot:run

## Alternative Deployment Strategy (Using Systemd)

### 7. Create JAR file

mvn package

### 8. Create Spring Boot Service File

sudo nano /etc/systemd/system/springboot-api.service

### Add the following content (adjust paths as necessary):

```ini
[Unit]
Description=Spring Boot API
After=syslog.target

[Service]
User=centos
ExecStart=/usr/bin/java -jar /path/to/your-application.jar
SuccessExitStatus=143

[Install]
WantedBy=multi-user.target