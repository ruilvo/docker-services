#!/bin/bash

# Find all docker-compose files in the repo
compose_files=$(find . -name "docker-compose.yml" -o -name "docker-compose.yaml")

# Take down all containers
docker compose -f $compose_files down

# Delete all images
docker image prune -af

# Delete build cache
docker builder prune -af

# Turn up all containers again
docker compose -f $compose_files up -d --build
