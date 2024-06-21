# Deploy a .NET/ASP.NET REST API on CentOS

This guide outlines the steps to deploy a .NET/ASP.NET REST API on an CentOS server.

## 1. Update System Packages

sudo yum update

## 2. Install .NET 7 SDK and Git

sudo yum install dotnet-sdk-7.0 git -y

## 3. Install Entity Framework Core Tools

dotnet tool install --global dotnet-ef --version 7.0.0

export PATH="$PATH:~/.dotnet/tools"

## 4. Clone the Project

git clone https://github.com/GerromeSieger/RecipeApp-Dotnet.git

cd RecipeApp-Dotnet

## 5. Restore Dependencies

dotnet restore

## 6. Configure Database

### Ensure your database connection string is properly set in appsettings.json

## 7. Run Migrations

dotnet ef migrations add InitialMigration

dotnet ef database update

## 8. Run Application

dotnet run --urls http://0.0.0.0:5000

## 9. Set Up as a Systemd Service (Optional)

### Create a service file:

sudo nano /etc/systemd/system/dotnet-api.service

### Add the following content (adjust paths as necessary):

```ini
[Unit]
Description=.NET Web API App running on Ubuntu

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