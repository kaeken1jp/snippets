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

# jshell

https://docs.oracle.com/javase/9/jshell/introduction-jshell.htm#JSHEL-GUID-DA9FA090-7015-4F30-BBD0-5F6ED0EBDF91

```
The Java Shell tool (JShell) is an interactive tool for learning the Java programming language and prototyping Java code. JShell is a Read-Evaluate-Print Loop (REPL), which evaluates declarations, statements, and expressions as they are entered and immediately shows the results. The tool is run from the command line.
```

```sh
$ jshell

jshell> 

jshell> int a = 1
a ==> 1

jshell> String b = "str"
b ==> "str"

jshell> /exit
|  Goodbye
```



# Hello World

- ファイル名とクラス名は同名とする
- 1ファイルに1クラスを記述するようにする

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

or

$ javac -encoding utf8 Hello.java
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
    // i = 10 + 3;
    // System.out.println(i); // 13
    // i = 10 - 3;
    // System.out.println(i); // 7
    // int i;
    // i = 10 / 3;
    // System.out.println(i); // 3
    // i = 10 % 3;
    // System.out.println(i); // 1
    // int x = 5;
    // ++ --
    // x++;
    // System.out.println(x); // 6
    // x--;
    // System.out.println(x); // 5

    // Assignment
    // int x = 5;
    // x += 2;
    // System.out.println(x); // 7
    // int x = 5;
    // x -= 2;
    // System.out.println(x); // 3
    // int x = 5;
    // x *= 2;
    // System.out.println(x); // 10
    
    // int x = 10;
    // x /= 2;
    // System.out.println(x); // 5
    
    // int x = 10;
    // x %= 3;
    // System.out.println(x); // 1
    
    String s;
    s = "hello " + "world";
    System.out.println(s);
  }

}
```




# Shift Operator

![](https://i.gyazo.com/393ce371c378b132a61802078d94caf1.png)

![](https://i.gyazo.com/eca566e2c75d6c180171a7d5bd880ef8.png)


```java
class MyApp{
  public static void main(String[] args){
    System.out.println( -8 >> 2 ); // Signed Right shift operator (>>) 
    System.out.println( -8 >>> 2 ); // Unsigned Right shift operator (>>>)
    System.out.println( -8 << 2 ); // Left shift operator (<<)

    System.out.println( -8 >> 3 ); // Signed Right shift operator (>>) 
    System.out.println( -8 >>> 3 ); // Unsigned Right shift operator (>>>)
    System.out.println( -8 << 3 ); // Left shift operator (<<)
  }
}
```

```
-2
1073741822
-32

-1
536870911
-64
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

```java
int i = Integer.parseInt(str);
```

# printf

```java
public class MyApp {

  public static void main(String[] args) {

    int score = 50;
    double height = 165.8;
    String name = "foo";

    System.out.printf("name: %s, score: %d, height: %f\n", name, score, height);
    System.out.printf("name: %-10s, score: %10d, height: %5.2f\n", name, score, height);

    String s = String.format("name: %10s, score: %-10d, height: %5.2f\n", name, score, height);
    System.out.println(s);
  }

}
```

```
name: foo, score: 50, height: 165.800000
name: foo       , score:         50, height: 165.80
name:        foo, score: 50        , height: 165.80
```

# format

```java
import java.util.Calendar;
import java.util.Locale;

public class TestFormat {
    
    public static void main(String[] args) {
      long n = 461012;
      System.out.format("%d%n", n);      //  -->  "461012"
      System.out.format("%08d%n", n);    //  -->  "00461012"
      System.out.format("%+8d%n", n);    //  -->  " +461012"
      System.out.format("%,8d%n", n);    // -->  " 461,012"
      System.out.format("%+,8d%n%n", n); //  -->  "+461,012"
      
      double pi = Math.PI;

      System.out.format("%f%n", pi);       // -->  "3.141593"
      System.out.format("%.3f%n", pi);     // -->  "3.142"
      System.out.format("%10.3f%n", pi);   // -->  "     3.142"
      System.out.format("%-10.3f%n", pi);  // -->  "3.142"
      System.out.format(Locale.FRANCE,
                        "%-10.4f%n%n", pi); // -->  "3,1416"

      Calendar c = Calendar.getInstance();
      System.out.format("%tB %te, %tY%n", c, c, c); // -->  "May 29, 2006"

      System.out.format("%tl:%tM %tp%n", c, c, c);  // -->  "2:34 am"

      System.out.format("%tD%n", c);    // -->  "05/29/06"
    }
}
```



# String

```java
public class MyApp {

  public static void main(String[] args) {
    String s = "abcdef";
    System.out.println(s.length()); // 6
    System.out.println(s.substring(2, 5)); // cde
    System.out.println(s.replaceAll("ab", "AB"));

    String s1 = "ab";
    String s2 = "ab";

    if (s1.equals(s2)) {
      System.out.println("same!");
    }

    if (s1 == s2) {
      System.out.println("same!same!");
    }

    String ss1 = new String("ab");
    String ss2 = new String("ab");

    if (ss1 == ss2) {
      System.out.println("same!same!same!");
    }
  }

}
```

# array

```java
public class ClassName{
     public static void main(String []args){
        double array[] = {-0.2, 4.5, 2.0, 10, -5};
        System.out.println(array[2]);
        for (double e: array){
            System.out.println(e);
        }
     }
}
```

```
2.0
-0.2
4.5
2.0
10.0
-5.0
```



# Math,Random

```java
import java.util.Random;

public class MyApp {

  public static void main(String[] args) {
    double d = 53.234;
    System.out.println(Math.ceil(d)); // 54
    System.out.println(Math.floor(d)); // 53
    System.out.println(Math.round(d)); // 53
    System.out.println(Math.PI);
    // Math.random()

    Random r = new Random();
    System.out.println(r.nextDouble()); // 0 - 1
    System.out.println(r.nextInt(100)); // 0 - 100
    System.out.println(r.nextBoolean());
  }

}
```

# ArrayList, LinkedList

```java
import java.util.*;

public class MyApp {

  public static void main(String[] args) {
    // ArrayList
    // LinkedList ☓ 検索 ◯ 追加／削除

    // ArrayList<Integer> sales = new ArrayList<>();
    List<Integer> sales = new ArrayList<>();

    sales.add(10);
    sales.add(20);
    sales.add(30);

    for (int i = 0; i < sales.size(); i++) {
      System.out.println(sales.get(i));
    }

    sales.set(0, 100);
    sales.remove(2);

    for (Integer sale : sales) {
      System.out.println(sale);
    }
  }

}
```

```
10
20
30
100
20
```

# sort

```java
List<String> names = Arrays.asList("Alex", "Charles", "Brian", "David");
 
//Natural order
Collections.sort(names);    //[Alex, Brian, Charles, David]
 
//Reverse order
Collections.sort(names, Collections.reverseOrder());    [David, Charles, Brian, Alex]   
```



# HashSet, TreeSet, LinkedHashSet

```java
import java.util.*;

public class MyApp {

  public static void main(String[] args) {
    // HashSet
    // TreeSet
    // LinkedHashSet

    // HashSet<Integer> sales = new HashSet<>();
    Set<Integer> sales = new HashSet<>();

    sales.add(10);
    sales.add(20);
    sales.add(30);
    sales.add(10);

    System.out.println(sales.size()); // 3

    for (Integer sale : sales) {
      System.out.println(sale);
    }

    sales.remove(30);

    for (Integer sale : sales) {
      System.out.println(sale);
    }
  }

}
```


```
3
20
10
30
20
10
```


# HashMap, TreeMap, LinkedHashMap

```java
import java.util.*;

public class MyApp {

  public static void main(String[] args) {
    // HashMap: key value
    // TreeMap
    // LinkedHashMap

    // HashMap<String, Integer> sales = new HashMap<>();
    Map<String, Integer> sales = new HashMap<>();

    sales.put("tom", 10);
    sales.put("bob", 20);
    sales.put("steve", 30);

    System.out.println(sales.get("tom")); // 10
    System.out.println(sales.size()); // 3

    for (Map.Entry<String, Integer> sale : sales.entrySet()) {
      System.out.println(sale.getKey() + ":" + sale.getValue());
    }

    sales.put("tom", 100);
    sales.remove("steve");

    for (Map.Entry<String, Integer> sale : sales.entrySet()) {
      System.out.println(sale.getKey() + ":" + sale.getValue());
    }
  }

}
```

```
10
3
tom:10
bob:20
steve:30
tom:100
bob:20
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

```java
class MyApp {
  public static void main(String[] args) {
    int i = 100;
    // if( i < 100 ) {
    //   System.out.println("i < 100");
    // }else{
    //   System.out.println("i >= 100");
    // }
    if( i < 100 ) 
      System.out.println("i < 100");
    else
      System.out.println("i >= 100");
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

# TypeOf

```java
class Type {
    static String of(byte x) {
        return (x + " is a byte.");
    }
    static String of(short x) {
        return (x + " is a short.");
    }
    static String of(int x) {
        return (x + " is an int.");
    }
    static String of(float x) {
        return (x + " is a float.");
    }
    static String of(double x) {
        return (x + " is a double.");
    }
    static String of(char x) {
        return (x + " is a char.");
    }
    static String of(boolean x) {
        return (x + " is a boolean.");
    }
    static String of(Object x) {
        final String className = x.getClass().getName();
        return (x + " is instance of " + className);
    }
}
class Main {
    public static void main(String[] args) {
        Type t = new Type();
        System.out.println(Type.of(t));
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


# Abstract Classes and Methods

```java
// Abstract Classes
abstract class User {
  public abstract void sayHi(); // Abstract Methods
}

class JapaneseUser extends User {
  @Override
  public void sayHi() {
    System.out.println("Konnichiwa!");
  }
}

class AmericanUser extends User {
  @Override
  public void sayHi() {
    System.out.println("Hi!");
  }
}

public class MyApp {

  public static void main(String[] args) {
    AmericanUser tom = new AmericanUser();
    JapaneseUser aki = new JapaneseUser();
    tom.sayHi();
    aki.sayHi();
  }

}
```

```
Hi!
Konnichiwa!
```

# Interface

```java
// interface

interface Printable {
  // const
  double VERSION = 1.2;
  // abstract method
  void print();
  // default method
  public default void getInfo() {
    System.out.println("I/F ver. " + Printable.VERSION);
  }
  // static method
  // (snip)
}

class User implements Printable {
  @Override
  public void print() {
    System.out.println("Now printing user profile...");
  }
}

public class MyApp {

  public static void main(String[] args) {
    User tom = new User();
    tom.print();
    tom.getInfo();
  }

}
```

```
I/F ver. 1.2
```

# Enums

```
An enum is a special "class" that represents a group of constants (unchangeable variables, like final variables).

To create an enum, use the enum keyword (instead of class or interface), and separate the constants with a comma. Note that they should be in uppercase letters:
```

```java
// enum

enum Result {
  SUCCESS, // 0
  ERROR, // 1
}

public class MyApp {

  public static void main(String[] args) {
    Result res;

    res = Result.ERROR;

    switch (res) {
      case SUCCESS:
        System.out.println("OK!");
        System.out.println(res.ordinal()); // 0
        break;
      case ERROR:
        System.out.println("NG!");
        System.out.println(res.ordinal()); // 1
        break;
    }

  }

}
```

```
NG!
1
```

# Exceptions

```java
// Exceptions

class MyException extends Exception {
  public MyException(String s) {
    super(s);
  }
}

public class MyApp {

  public static void div(int a, int b) {
    try {
      if (b < 0) {
        throw new MyException("not minus!");
      }
      System.out.println(a / b);
    } catch (ArithmeticException e) {
      System.err.println(e.getMessage());
    } catch (MyException e) {
      System.err.println(e.getMessage());
    } finally {
      System.out.println(" -- end -- ");
    }
  }

  public static void main(String[] args) {
    div(3, 0);
    div(5, -2);
  }

}
```

```
/ by zero
 -- end -- 
not minus!
 -- end --
```


# Wrapper Classes

```java
/*
Wrapper Class
int -> Integer
double -> Double
*/

public class MyApp {

  public static void main(String[] args) {
    // Integer i = new Integer(32);
    // int n = i.intValue();

    Integer i = 32; // auto boxing
    i = null;
    int n = i; // auto unboxing

  }

}
```

```
Exception in thread "main" java.lang.NullPointerException
        at MyApp.main(MyApp.java:15)
```


# generics

```java
// generics

// class MyInteger {
//   public void getThree(int x) {
//     System.out.println(x);
//     System.out.println(x);
//     System.out.println(x);
//   }
// }

class MyData<T> {
  public void getThree(T x) {
    System.out.println(x);
    System.out.println(x);
    System.out.println(x);
  }
}

public class MyApp {

  public static void main(String[] args) {
    // MyInteger mi = new MyInteger();
    // mi.getThree(55);
    MyData<Integer> i = new MyData<>();
    i.getThree(32);
    MyData<String> s = new MyData<>();
    s.getThree("hello");
  }

}
```

```
32
32
32
hello
hello
hello
```

# Thread

```java
// Thread

class MyRunnable implements Runnable {
  @Override
  public void run() {
    for (int i = 0; i < 100; i++) {
      System.out.print('*');
    }
  }
}

public class MyApp {

  public static void main(String[] args) {
    MyRunnable r = new MyRunnable();
    Thread t = new Thread(r);
    t.start();

    for (int i = 0; i < 100; i++) {
      System.out.print('.');
    }
  }

}
```

```
*************************************.................***************......***********......**********..************.....**...*..***********.................*..........................................
```

# Lambda

```java
// Thread

// class MyRunnable implements Runnable { // 関数型インターフェース
//   @Override
//   public void run() {
//     for (int i = 0; i < 500; i++) {
//       System.out.print('*');
//     }
//   }
// }

public class MyApp {

  public static void main(String[] args) {
    // MyRunnable r = new MyRunnable();
    // Thread t = new Thread(r);
    // t.start();

    // ラムダ式
    // (引数) -> {処理}
    // new Thread(new Runnable() {
    //   @Override
    //   public void run() {
    //     for (int i = 0; i < 500; i++) {
    //       System.out.print('*');
    //     }
    //   }
    // }).start();
    new Thread(() -> {
      for (int i = 0; i < 500; i++) {
        System.out.print('*');
      }
    }).start();

    for (int i = 0; i < 500; i++) {
      System.out.print('.');
    }
  }

}
```


# stream(), filter(), map(), forEach()

```java
import java.util.*;

public class MyApp {

  public static void main(String[] args) {
    // Stream
    List<Integer> sales = new ArrayList<>(Arrays.asList(12, 30, 22, 4, 9));
    // for (Integer sale : sales) {
    //   System.out.println(sale);
    // }

    sales
      .stream()
      // 中間処理
      .filter(e -> e % 3 == 0) // ラムダ式 引数 -> 処理
      .map(e -> "(" + e + ")")
      // 終端処理
      .forEach(System.out::println);

  }

}
```

```
(12)
(30)
(9)
```

# LocalDateTime

```java
import java.time.*;
import java.time.format.DateTimeFormatter;

public class MyApp {

  public static void main(String[] args) {
    LocalDateTime d = LocalDateTime.now();
    // LocalDateTime d = LocalDateTime.of(2016, 1, 1, 10, 10, 10);
    // LocalDateTime d = LocalDateTime.parse("2016-01-01T10:10:10");

    System.out.println(d.getYear());
    System.out.println(d.getMonth());
    System.out.println(d.getMonth().getValue());

    System.out.println(d.plusMonths(2).minusDays(3));

    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy!MM!dd!");
    System.out.println(d.format(dtf));

  }

}
```

```
2020
MAY
5
2020-06-30T01:35:32.127370
2020!05!03!
```


# jar (Java Archive)

```
jar-The Java Archive Tool
jar combines multiple files into a single JAR archive file.

SYNOPSIS
Create jar file
jar c[v0M]f jarfile [-C dir] inputfiles [-Joption]
jar c[v0]mf manifest jarfile [-C dir] inputfiles [-Joption] [-e entrypoint]
jar c[v0M] [-C dir] inputfiles [-Joption]
jar c[v0]m manifest [-C dir] inputfiles [-Joption]
Update jar file
jar u[v0M]f jarfile [-C dir] inputfiles [-Joption]
jar u[v0]mf manifest jarfile [-C dir] inputfiles [-Joption] [-e entrypoint]
jar u[v0M] [-C dir] inputfiles [-Joption]
jar u[v0]m manifest [-C dir] inputfiles [-Joption]
Extract jar file
jar x[v]f jarfile [inputfiles] [-Joption]
jar x[v] [inputfiles] [-Joption]
List table of contents of jar file
jar t[v]f jarfile [inputfiles] [-Joption]
jar t[v] [inputfiles] [-Joption]
Add index to jar file
jar i jarfile [-Joption]

cuxtiv0Mmf
Options that control the jar command.
jarfile
File name of the Jar file to be created (c), updated (u), extracted (x), or have its table of contents viewed (t). The -f option and filename jarfile are a pair -- if either is present, they must both appear. Note that omitting -f and jarfile accepts jar file from standard input (for x and t) or sends jar file to standard output (for c and u).
inputfiles
Files or directories separated by spaces, to be combined into jarfile (for c and u), or to be extracted (for x) or listed (for t) from jarfile. All directories are processed recursively. The files are compressed unless option -0 (zero) is used.
manifest
Pre-existing manifest file whose name : value pairs are to be included in MANIFEST.MF in the jar file. The -m option and filename manifest are a pair -- if either is present, they must both appear. The letters m and f must appear in the same order that manifest and jarfile appear.
entrypoint
The name of the class that set as the application entry point for stand-alone applications bundled into executable jar file. The -e option and entrypoint are a pair -- if either is present, they must both appear. The letters m, f and e must appear in the same order that manifest, jarfile, entrypoint appear.
-C dir
Temporarily changes directories to dir while processing the following inputfiles argument. Multiple -C dir inputfiles sets are allowed.
-Joption
Option passed into the Java runtime environment. (There must be no space between -J and option).
```

- make

```sh
jar cvf <JAR_FILE_NAME> <FILE_NAMES>

jar cvf file.jar *.*
```

- extract

```sh
jar -xvf file.jar
```

- exec

```sh
java -jar file.jar
```


# key input

```java
import java.io.*;
public class KeyInput {
    public static void main(String[] args) {
        int  i;
        System.out.println( "input string:" );
        try{
            i = System.in.read();
            System.out.print( "your input key is " + (char)i + ", ");
            System.out.println( "the char code is " + i);
        }
        catch(IOException e){
            System.err.println( "error" );
        }
    }
}
```

```
input string:
A
your input key is A, the char code is 65
```

