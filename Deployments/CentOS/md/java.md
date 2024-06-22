# Deploy a Java/Spring Boot REST API on CentOS 9

This guide outlines the steps to deploy a Java/Spring Boot REST API on a CentOS 9 server.

## 1. Update System Packages

``` bash
sudo yum update -y
```

## 2. Install OpenJDK, Git, and Maven

``` bash
sudo yum install java-17-openjdk-devel git maven -y
```

## 3. Clone the Project

``` bash
git clone https://github.com/GerromeSieger/RecipeApp-Java.git
cd RecipeApp-Java
```

## 4. Build the Project

``` bash
mvn clean install
```

## 5. Configure Database

### Ensure your database connection is properly configured in application.properties or application.yml

## 6. Run the Application

``` bash
mvn spring-boot:run
```

## 7. Verify Deployment

### Open a web browser and navigate to http://publicip:8080/swagger to access the swagger documentation.

## Alternative Deployment Strategy (Using Systemd)

## 8. Create JAR file

``` bash
mvn package
```

## 9. Create Spring Boot Service File

``` bash
sudo nano /etc/systemd/system/springboot-api.service
```

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

```

## 10. Reload Daemon, Start and Enable springboot-api Service

``` bash
sudo systemctl daemon-reload
sudo systemctl start springboot-api
sudo systemctl enable springboot-api
```