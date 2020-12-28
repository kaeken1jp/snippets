https://docs.docker.com/

# concept

![](https://i.gyazo.com/90cc92abff873fcd6280ed12ae1b114c.png)

# flow

![](https://i.gyazo.com/29aa934b6ade49bb1fe9f6ac29fbb64d.jpg)

# install (MacOS)

## download and install docker desktop software

https://hub.docker.com/

# version

```sh
$ docker version
```

# run

```sh
$ docker run -d -p 80:80 --name webserver nginx
$ open http://localhost
```

# stop/start
```sh
$ docker container stop webserver
webserver

$ docker container start webserver
webserver
```

# ls

```sh
$ docker container ls -a
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                      PORTS               NAMES
xxxxxxxxxxxx        nginx               "nginx -g 'daemon of…"   2 minutes ago       Exited (0) 58 seconds ago                       webserver
```

# 
