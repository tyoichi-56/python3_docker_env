# python3_docker_env
for creating python3 container

## Runtime environment

* Ubuntu24.04
* Docker version 27.1.2
* Docker Compose version v2.29.1

## steps

* edit `requirements.txt` for installing python package which you want to use to container
* create container
```
$ docker compose build
$ docker compose up -d
```
* crate python script which you want do on container
  * see sample
* do python script by local user
```
$ docker container exec -it --user 1000 python3_container python pandas_sample.py
```
