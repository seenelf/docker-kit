### Docker command

```
$ docker-compose up -d         # start containers in background
$ docker-compose kill          # stop containers
$ docker-compose up -d --build # force rebuild of Dockerfiles
$ docker-compose rm            # remove stopped containers
$ docker ps                    # see list of running containers
$ docker exec -ti [NAME] bash
```

### How to setup docker nginx reverse proxy

create network because docker-compose will create their own network. The nginx_reverse_proxy will not see the container inside. We need to give them a network name so they can see eachother.

`docker network create nginx_proxy`

run nginx_reverse_proxy with a name and network

`docker run -d -p 80:80 --network nginx_proxy --name nginx_proxy -v /var/run/docker.sock:/tmp/docker.sock:ro jwilder/nginx-proxy`

run docker-compose up in any project you want don't for get to update the config in `docker-compose.yml`  

```
...
    expose:
        - 8090
    environment:
        - VIRTUAL_HOST=xxx
        - VIRTUAL_PORT=8090
...
networks:
    default:
        external:
            name: nginx_proxy
```
