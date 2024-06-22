# Deploy a .NET/ASP.NET REST API on CentOS 9

This guide outlines the steps to deploy a .NET/ASP.NET REST API on an CentOS 9 server.

1. Update System Packages

``` bash
sudo yum update -y
```

2. Install .NET 7 SDK and Git

``` bash
sudo yum install dotnet-sdk-7.0 git -y
```

3. Install Entity Framework Core Tools

``` bash
dotnet tool install --global dotnet-ef --version 7.0.0
export PATH="$PATH:~/.dotnet/tools"
```

4. Clone the Project

``` bash
git clone https://github.com/GerromeSieger/RecipeApp-Dotnet.git
cd RecipeApp-Dotnet
```

5. Restore Dependencies

``` bash
dotnet restore
```

6. Configure Database

Ensure your database connection string is properly set in appsettings.json

7. Run Migrations

``` bash
dotnet ef migrations add InitialMigration
dotnet ef database update
```

8. Run Application

``` bash
dotnet run --urls http://0.0.0.0:5000
```

9. Verify Deployment

Open a web browser and navigate to http://publicip:5000/swagger to access the swagger documentation.

## Alternative Deployment Strategy (Using Systemd)

10. Set Up as a Systemd Service

Create a service file:

``` bash
sudo nano /etc/systemd/system/dotnet-api.service
```

Add the following content (adjust paths as necessary):

```ini
[Unit]
Description=.NET Web API App running on Centos

[Service]
WorkingDirectory=/path/to/RecipeApp-Dotnet
ExecStart=/usr/bin/dotnet /path/to/RecipeApp-Dotnet/YourAppName.dll
Restart=always
RestartSec=10
KillSignal=SIGINT
SyslogIdentifier=dotnet-api
User=centos
Environment=ASPNETCORE_ENVIRONMENT=Production
Environment=DOTNET_PRINT_TELEMETRY_MESSAGE=false

[Install]
WantedBy=multi-user.target

```
11. Reload Daemon, Start and Enable dotnet-api Service

``` bash
sudo systemctl daemon-reload
sudo systemctl start dotnet-api
sudo systemctl enable dotnet-api
```