#!/usr/bin/env bash

# create buzzwoo network for docker
docker network create global_network &>/dev/null

# make sure the nginx-proxy is running, needed for local vhost
docker kill nginx-proxy &>/dev/null
docker rm nginx-proxy &>/dev/null
docker run -d -p 80:80 \
    --name nginx-proxy \
    --net global_network -e ENABLE_IPV6=true \
    -v /var/run/docker.sock:/tmp/docker.sock:ro \
    jwilder/nginx-proxy &>/dev/null

# spin up containers
docker-compose up -d --build