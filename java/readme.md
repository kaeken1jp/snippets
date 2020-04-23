# website

[Java | Oracle](https://www.java.com/en/)
[OpenJDK](https://openjdk.java.net/)

# JDK, JRE, JVM

![](https://i.gyazo.com/f7de79bf9be4da527dacb946f7c135b0.png)


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

# comment

```java
  // comment
  /*
    comment
    comment
    comment
    comment
  */
```

# variables

```java
class MyApp {
  public static void main(String[] args) {
    String name = "foo";
    
    System.out.println("hello " + name);
    System.out.println("hello " + name +  " again!");
  }
}
```

# type

```java
public class MyApp {

  public static void main(String[] args) {
    // char
    char a = 'a';
    
    // byte short int long
    int x = 10;
    long y = 5555555555L; // L
    
    // float double
    double d = 23423.344;
    float f = 32.33F; // F
    
    // boolean
    boolean flag = true; // false
    
    // string
    // \n
    // \t
    String msg = "Hello Wo\nrld Again\t!";
    System.out.println(msg);
  }

}
```

# Operators

```java
public class MyApp {

  public static void main(String[] args) {
    // + - * / %
    // ++ --
    // int i;
    // i = 10 / 3;
    // System.out.println(i); // 3
    // i = 10 % 3;
    // System.out.println(i); // 1
    // int x = 5;
    // x++;
    // System.out.println(x); // 6
    // x--;
    // System.out.println(x); // 5

    // int x = 5;
    // // x = x + 12;
    // x += 12;
    // System.out.println(x);

    String s;
    s = "hello " + "world";
    System.out.println(s);
  }

}
```


# cast

```java
public class MyApp {

  public static void main(String[] args) {
    // double d = 52343.231;
    // int i = (int)d;
    // System.out.println(i);

    int i = 10;
    double d = (double)i / 4;
    System.out.println(d);
  }

}
```




# Scanner & next()

```java
import java.util.Scanner;

class MyApp {
  public static void main(String[] args) {
    System.out.println("Your name? ");
    String name = new Scanner(System.in).next();

    System.out.println("hello " + name);
    System.out.println("hello " + name + " again!");
  }
}
```

```
$ (exec)
Your name? 
foo
hello foo
hello foo again!
```

# nextInt()

```java
import java.util.Scanner;

class MyApp {
  public static void main(String[] args) {
    System.out.print("Your guess? ");
    Integer guess = new Scanner(System.in).nextInt();
    
    System.out.println("Your guess: " + guess);
  }
}
```

# if

```java
public class MyApp {

  public static void main(String[] args) {
    // if
    // > >= < <= == !=
    // && || !
    int score = 95;
    if (score > 80) {
      System.out.println("Great!");
    } else if (score > 60) {
      System.out.println("Good!");
    } else {
      System.out.println("so so ... !");
    }
    String msg = score > 80 ? "Great!" : "so so ... !";
    System.out.println(msg);
  }

}
```

# switch

```java
public class MyApp {

  public static void main(String[] args) {
    // switch
    String signal = "green";
    switch (signal) {
      case "red":
        System.out.println("stop!");
        break;
      case "blue":
      case "green":
        System.out.println("go!");
        break;
      case "yellow":
        System.out.println("caution!");
        break;
      default:
        System.out.println("wrong signal!");
        break;
    }
  }
}
```




# Random

```java
import java.util.Scanner;
import java.util.Random;

class MyApp {
  public static void main(String[] args) {
    Integer answer = new Random().nextInt(10) + 1;
    
    System.out.print("Your guess? ");
    Integer guess = new Scanner(System.in).nextInt();
    
    if (answer == guess) {
      System.out.println("Bingo!");
    } else if (answer > guess ) {
      System.out.println("The answer is higher!");
    } else {
      System.out.println("The answer is lower!");
    }
    
    System.out.println("The answer was " + answer);
  }
}
```

# while & break

```java
public class MyApp {

  public static void main(String[] args) {
    // while
    // 0 - 9
    int i = 100;
    while (i < 10) {
      System.out.println(i);
      i++;
    }
    
    do {
      System.out.println(i);
      i++;
    } while (i < 10);
  }

}
```

