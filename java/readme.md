[Java | Oracle](https://www.java.com/en/)

# version

```sh
$ java -version
java version "1.6.0_65"
Java(TM) SE Runtime Environment (build 1.6.0_65-b14-468)
Java HotSpot(TM) 64-Bit Server VM (build 20.65-b04-468, mixed mode)
```

# Hello World

```sh
$ cat Hello.java
```

```java
public class Hello {
    public static void main(String[] args) {
        System.out.println("Hello World");
    }
}
```


```sh
$ javac Hello.java
```

```sh
$ ls
Hello.class	Hello.java
```

```sh
$ java Hello
```

```
Hello World
```

