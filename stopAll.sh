#!/bin/bash
# Title: Stop all services
# Author: Cedric Kolarik

# stop running 
docker stop todoui
docker stop postgresdb
docker stop todobackend

# remove all
docker remove todoui
docker remove postgresdb
docker remove todobackend
# also network
docker network rm todonet