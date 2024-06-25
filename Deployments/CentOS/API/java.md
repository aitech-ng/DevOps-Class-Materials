# Deploy a Java/Spring Boot REST API on CentOS 9

This guide outlines the steps to deploy a Java/Spring Boot REST API on a CentOS 9 server.

1. Update System Packages

``` bash
sudo yum update -y
```

2. Install OpenJDK, Git, tar and wget

``` bash
sudo yum install java-17-openjdk-devel git wget tar -y
```

3. Install Maven

```bash
wget https://dlcdn.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz
sudo tar xzf apache-maven-3.9.6-bin.tar.gz -C /opt
sudo nano /etc/profile.d/maven.sh
```
pash this:
```
export M2_HOME=/opt/apache-maven-3.9.6
export PATH=${M2_HOME}/bin:${PATH}
```
```bash
sudo chmod +x /etc/profile.d/maven.sh
source /etc/profile.d/maven.sh
```

4. Clone the Project

``` bash
git clone https://github.com/GerromeSieger/RecipeApp-Java.git
cd RecipeApp-Java
```

5. Build the Project

``` bash
mvn clean install
```

6. Configure Database

Ensure your database connection is properly configured in application.properties or application.yml

7. Run the Application

``` bash
mvn spring-boot:run
```

8. Verify Deployment

Open a web browser and navigate to http://publicip:8080/swagger to access the swagger documentation.

9. Open the Firewall

```bash
sudo firewall-cmd --permanent --add-port=8080/tcp
sudo firewall-cmd --reload
```

## Alternative Deployment Strategy (Using Systemd)

10. Create JAR file

``` bash
mvn package
```

11. Create Spring Boot Service File

``` bash
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

12. Reload Daemon, Start and Enable springboot-api Service

``` bash
sudo systemctl daemon-reload
sudo systemctl start springboot-api
sudo systemctl enable springboot-api
sudo systemctl status springboot-api
```