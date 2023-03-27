#!/bin/bash

# Author: Cedric Kolarik

bash stopAll.sh

# Run postgres Database
docker run -d -p 5432:5432 --name postgresdb -e POSTGRES_USER=matthias -e POSTGRES_PASSWORD=password -e POSTGRES_DB=mydb -d postgres

# Build and run the Backend
docker build -f Dockerfile-todo -t todobackend:v0.1 .
docker run -d -p 8080:8080 -e SPRING_PROFILES_ACTIVE=dev --name todobackend todobackend:v0.1

# Build and run the Frontend
docker build -f Dockerfile-todoui -t todoui:v0.1 .
docker run -d -p 8090:8090 -e SPRING_PROFILES_ACTIVE=dev --name todoui todoui:v0.1

# create the network
docker network create todonet

docker network connect todonet todobackend
docker network connect todonet todoui
docker network connect todonet postgresdb