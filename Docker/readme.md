https://docs.docker.com/

# concept

![](https://i.gyazo.com/90cc92abff873fcd6280ed12ae1b114c.png)


# lifecycle

![](https://i.gyazo.com/3a69a1de75e4540500101c95f4fb7b28.png)

# flow

![](https://i.gyazo.com/29aa934b6ade49bb1fe9f6ac29fbb64d.jpg)

![](https://i.gyazo.com/db07448100ad5ad5a119c1d8134e43a9.png)

![](https://i.gyazo.com/8a39eb640ee0ec261df84f83dcc6a29a.jpg)

![](https://i.gyazo.com/956d5f1950e6ac59cb0e6c6ac7405b75.png)

![](https://i.gyazo.com/d0b212496712727b10e9d4380ce6e07b.jpg)

![](https://i.gyazo.com/66c63888420ab1e11929cd4c579ed8d5.jpg)

![](https://i.gyazo.com/df41d6eace4d82d2ba857304a591aada.png)

![](https://i.gyazo.com/34db2ddb58491d4a76ad0bc8128b3e10.jpg)

![](https://i.gyazo.com/f5cca632775741692da2e00aada19a9d.png)

![](https://i.gyazo.com/20c04eb5766404f59a122a5191ca9d07.jpg)

![](https://i.gyazo.com/65ef687df77b67da02b72a2f070352f0.png)

![](https://i.gyazo.com/daf84ac42b63f7d5c990704c2cb9468d.jpg)

![](https://i.gyazo.com/866af96d899caad428ad2e7410425e88.jpg)

![](https://i.gyazo.com/dccb73272bb6ef068d3ef87ccdace4f6.jpg)

![](https://i.gyazo.com/efeb5855743b583a14697fb9d621b758.jpg)

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
