https://docs.docker.com/

# concept

![](https://i.gyazo.com/90cc92abff873fcd6280ed12ae1b114c.png)

# flow

![](https://i.gyazo.com/29aa934b6ade49bb1fe9f6ac29fbb64d.jpg)

![](https://i.gyazo.com/db07448100ad5ad5a119c1d8134e43a9.png)

![](https://i.gyazo.com/8a39eb640ee0ec261df84f83dcc6a29a.jpg)

![](https://i.gyazo.com/956d5f1950e6ac59cb0e6c6ac7405b75.png)

![](https://i.gyazo.com/d0b212496712727b10e9d4380ce6e07b.jpg)

![](https://i.gyazo.com/66c63888420ab1e11929cd4c579ed8d5.jpg)

![]()

![]()

![]()

![]()

![]()

![]()

![]()

![]()

![]()

![]()

![]()

![]()

![]()



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
