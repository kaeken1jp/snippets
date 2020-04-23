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
import java.util.Scanner;

class MyApp {
  public static void main(String[] args) {
    Integer answer = 6;
    
    System.out.print("Your guess? ");
    Integer guess = new Scanner(System.in).nextInt();
    
    if (answer == guess) {
      System.out.println("Bingo!");
    } else if (answer > guess) {
      System.out.println("The answer is higher!");
    } else {
      System.out.println("The answer is lower!");
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

