#### Setup

- install docker into your host machine.
- download this repository and put into your project root.

#### Run

- make sure you did not run **multiple docker projects on the same port (9000)** it will not work.
- start docker by execute command `docker-compose up -d` on your project root.
- check [http://localhost:9000](http://localhost:9000) to see if it works

#### Shutdown

- execute command `docker-compose kill` on your project root.

#### Install custom php module

- add your script in `docker/php7.docker`
- rebuild your image by execute command `docker-compose build` on your project root.

#### Mysql user/pass

- by default mysql password is set by `docker-compose.yml` feel free to update also database name.
    don't forget to rebuild your docker image if you change any config.
- for database host you need to use `db` instead of `localhost`
- check [http://localhost:9000/adminer.php](http://localhost:9000/adminer.php) to see if it works