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

# while & do - while

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


# for

```java
public class MyApp {

  public static void main(String[] args) {
    // for
    // 0 - 9
    // break
    // continue
    for (int i = 0; i < 10; i++) {
      if (i == 5) {
        // break;
        continue;
      }
      System.out.println(i);
    }
  }

}
```

# array

```java
public class MyApp {

  public static void main(String[] args) {
    // 配列
    // sales1, sales2, ...
    // sales

    // int[] sales;
    // sales = new int[3];

    // int[] sales;
    // sales = new int[] {100, 200, 300};

    int[] sales = {100, 200, 300};

    // sales[0] = 100;
    // sales[1] = 200;
    // sales[2] = 300;
    System.out.println(sales[1]); // 200
    sales[1] = 1000;
    System.out.println(sales[1]); // 1000
  }

}
```


# length

```java
public class MyApp {

  public static void main(String[] args) {
    // 配列
    // sales.length
    int[] sales = {700, 400, 500};

    // for (int i = 0; i < 3; i++) {
    // for (int i = 0; i < sales.length; i++) {
    //   System.out.println(sales[i]);
    // }

    for (int sale : sales) {
      System.out.println(sale);
    }
  }

}
```

# type


![](https://i.gyazo.com/6b1b3c8f53810a610378245a66665da1.png)

![](https://i.gyazo.com/0257900a6158c3e1b54f4fecafac9d48.png)

```java
public class MyApp {

  public static void main(String[] args) {
    // int x = 10;
    // int y = x;
    // y = 5;
    // System.out.println(x); // 10
    // System.out.println(y); // 5

    // int[] a = {3, 5, 7};
    // int[] b = a;
    // b[1] = 8;
    // System.out.println(a[1]); // 8
    // System.out.println(b[1]); // 8

    String s = "hello";
    String t = s;
    t = "world";
    System.out.println(s); // hello
    System.out.println(t); // world
  }

}
```

# method

```java
public class MyApp {

  // method

  // public static void sayHi() {
  // public static void sayHi(String name) {
  public static String sayHi(String name) {
    // System.out.println("Hi!");
    // System.out.println("Hi! " + name);
    return "Hi! " + name;
  }

  public static void main(String[] args) {
    // sayHi();
    // sayHi("Tom");
    // sayHi("Bob");
    String msg = sayHi("Steve");
    System.out.println(msg);
  }

}
```

# overload

```java
public class MyApp {

  public static void sayHi(String name) {
    // int x = 10;
    System.out.println("Hi! " + name);
  }

  // overload

  public static void sayHi() {
    System.out.println("Hi! Nobody!");
  }

  public static void main(String[] args) {
    sayHi();
    sayHi("Steve");
    // System.out.println(name);
    // System.out.println(x);
  }

}
```


# class

```java
class User {
  String name = "Me!"; // field

  void sayHi() {
    System.out.println("hi!");
  }
}

public class MyApp {

  public static void main(String[] args) {
    // int x;
    // String s;

    // Class
    User tom;
    tom = new User(); // instance
    System.out.println(tom.name);
    tom.sayHi();
  }

}
```

# constructor

```java
class User {
  String name;

  // constructor
  User(String name) {
    this.name = name;
  }

  // this()

  User() {
    // this.name = "Me!";
    this("Me!");
  }

  void sayHi() {
    System.out.println("hi! " + this.name);
  }
}

public class MyApp {

  public static void main(String[] args) {
    User tom;
    // tom = new User("Tom");
    tom = new User();
    System.out.println(tom.name);
    tom.sayHi();
  }

}
```


# extends, super(), override, annotation

```java
class User {
  String name;

  User(String name) {
    this.name = name;
  }

  void sayHi() {
    System.out.println("hi! " + this.name);
  }
}

class AdminUser extends User {

  AdminUser(String name) {
    super(name);
  }

  void sayHello() {
    System.out.println("hello! " + this.name);
  }

  // override
  @Override
  void sayHi() {
    System.out.println("[admin] hi! " + this.name);
  }
}

public class MyApp {

  public static void main(String[] args) {
    User tom = new User("tom");
    System.out.println(tom.name);
    tom.sayHi();

    AdminUser bob = new AdminUser("bob");
    System.out.println(bob.name);
    bob.sayHi();
    bob.sayHello();
  }

}
```

# public, private, protected

![](https://i.gyazo.com/509a7bfa7aa06679927d9f8abb3800a6.png)


# package, import

- MyApp

```java
package com.dotinstall.myapp;
import com.dotinstall.myapp.model.User;
import com.dotinstall.myapp.model.AdminUser;
// import com.dotinstall.myapp.model.*;

public class MyApp {

  public static void main(String[] args) {
    User tom = new User("tom");
    // System.out.println(tom.name);
    tom.sayHi();

    AdminUser bob = new AdminUser("bob");
    // System.out.println(bob.name);
    bob.sayHi();
    bob.sayHello();
  }

}
```

- AdminUser

```java
package com.dotinstall.myapp.model;

public class User {
  protected String name;

  public User(String name) {
    this.name = name;
  }

  public void sayHi() {
    System.out.println("hi! " + this.name);
  }
}
```

- User

```java
package com.dotinstall.myapp.model;

public class AdminUser extends User {

  public AdminUser(String name) {
    super(name);
  }

  public void sayHello() {
    System.out.println("hello! " + this.name);
  }

  @Override
  public void sayHi() {
    System.out.println("[admin] hi! " + this.name);
  }
}
```

# getter, setter

```java
class User {
  private String name;
  private int score;

  public User(String name, int score) {
    this.name = name;
    this.score = score;
  }

  public int getScore() { // getter
    return this.score;
  }

  public void setScore(int score) { // setter
    if (score > 0) {
      this.score = score;
    }
  }

}

public class MyApp {

  public static void main(String[] args) {
    User tom = new User("tom", 65);
    tom.setScore(85);
    tom.setScore(-22);
    System.out.println(tom.getScore());
  }

}
```

# static, Class Variables, Class Methods

```java
// static

class User {
  private String name;
  private static int count = 0; // Class Variables

  public User(String name) {
    this.name = name;
    User.count++;
  }

  public static void getInfo() { // Class Methods
    System.out.println("# of instances: " + User.count);
  }

}

public class MyApp {

  public static void main(String[] args) {
    User.getInfo(); // 0
    User tom = new User("tom");
    User.getInfo(); // 1
    User bob = new User("bob");
    User.getInfo(); // 2
  }

}
```

# Static initializer, Instance initializer

```java
// static

class User {
  private String name;
  private static int count; // Class Variables

  static {
    User.count = 0;
    System.out.println("Static initializer");
  }

  {
    System.out.println("Instance initializer");
  }

  public User(String name) {
    this.name = name;
    User.count++;
    System.out.println("Constructor");
  }

  public static void getInfo() { // Class Methods
    System.out.println("# of instances: " + User.count);
  }

}

public class MyApp {

  public static void main(String[] args) {
    User.getInfo(); // 0
    User tom = new User("tom");
    User.getInfo(); // 1
    User bob = new User("bob");
    User.getInfo(); // 2
  }

}
```

# final

```java
// Set a variable to final, to prevent it from being overridden/modified:

final class User {
  protected String name;
  private static final double VERSION = 1.1;

  public User(String name) {
    this.name = name;
    User.VERSION = 1.2;
  }

  public final void sayHi() {
    System.out.println("hi! " + this.name);
  }
}

class AdminUser extends User {

  public AdminUser(String name) {
    super(name);
  }

  @Override
  public void sayHi() {
    System.out.println("[admin] hi! " + this.name);
  }

}

public class MyApp {

  public static void main(String[] args) {
    User tom = new User("tom");
  }

}
```
