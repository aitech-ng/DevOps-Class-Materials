#!/bin/bash

if [ ! -f ".db_updated" ]; then
  dotnet ef migrations add init__
  dotnet ef database update
  touch .db_updated
fi

dotnet run --urls http://0.0.0.0:5000