#!/bin/bash

# Find all docker-compose files in the repo
compose_files=$(find . -name "docker-compose.yml" -o -name "docker-compose.yaml")

# Take down all containers
for file in $compose_files
do
    docker compose -f $file down
done

# Delete all images
docker image prune -af

# Delete build cache
docker builder prune -af

# Turn up all containers again
for file in $compose_files
do
    docker compose -f $file up -d --build
done
