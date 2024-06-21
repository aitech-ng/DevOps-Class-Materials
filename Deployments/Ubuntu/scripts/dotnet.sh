#!/bin/bash

sudo apt update

sudo add-apt-repository ppa:dotnet/backports -y

sudo apt install -y dotnet-sdk-7.0

dotnet tool install --global dotnet-ef --version 7.0.0

export PATH="$PATH:~/.dotnet/tools"

git clone https://github.com/GerromeSieger/RecipeApp-Dotnet.git

cd RecipeApp-Dotnet

dotnet restore

dotnet ef migrations add InitialMigration

dotnet ef database update

dotnet run --urls http://0.0.0.0:5000