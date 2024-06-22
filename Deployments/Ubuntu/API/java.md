# Deploy a Java/Spring Boot REST API on Ubuntu 24

This guide outlines the steps to deploy a Java/Spring Boot REST API on an Ubuntu 24 server.

1. Update System Packages

```bash
sudo apt update
```

2. Install OpenJDK 17

```bash
sudo apt install openjdk-17-jdk -y
```

3. Install Maven

```bash
wget https://downloads.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz
tar -xvf apache-maven-3.9.6-bin.tar.gz
sudo mv apache-maven-3.9.6 /opt/maven
sudo nano /etc/profile.d/maven.sh
```

Add the following content:

```bash
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export M2_HOME=/opt/maven
export MAVEN_HOME=/opt/maven
export PATH=${M2_HOME}/bin:${PATH}
```

Save and exit, then:

```bash
sudo chmod +x /etc/profile.d/maven.sh
source /etc/profile.d/maven.sh
```

4. Clone the Project

```bash
git clone https://github.com/GerromeSieger/RecipeApp-Java.git
cd RecipeApp-Java
```

5. Build the Project

```bash
mvn clean install
```

6. Configure Database

Ensure your database connection is properly configured in application.properties or application.yml

7. Run the Application

```bash
mvn spring-boot:run
```

8. Verify Deployment

Open a web browser and navigate to http://publicip:8080/swagger to access the swagger documentation.

## Alternative Deployment Strategy (Using Systemd)

9. Create JAR file

```bash
mvn package
```

10. Create Spring Boot Service File

```bash
sudo nano /etc/systemd/system/springboot-api.service
```

Add the following content (adjust paths as necessary):

```ini
[Unit]
Description=Spring Boot API
After=syslog.target

[Service]
User=root
ExecStart=/usr/bin/java -jar /root/RecipeApp-Java/target/RecipeApp-0.0.1-SNAPSHOT.jar
SuccessExitStatus=143

[Install]
WantedBy=multi-user.target

```
11. Reload Daemon, Start and Enable springboot-api Service

```bash
sudo systemctl daemon-reload
sudo systemctl start springboot-api
sudo systemctl enable springboot-api
sudo systemctl status springboot-api
```