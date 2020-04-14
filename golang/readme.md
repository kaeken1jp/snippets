# link

[The Go Programming Language](https://golang.org/)


# hello world

```go
package main

import (
  "fmt"
)

func main() {
  fmt.Println("Hello World")
}

// one line comment

/*
multi lines
multi lines
*/

```

# variable

```go
func main() {
    // var msg string
    // msg = "hello world"
    // var msg = "hello world"
    msg := "hello world"
    fmt.Println(msg)

    // var a, b int
    // a, b = 10, 15
    a, b := 10, 15

    var (
        c int
        d string
    )
    c = 20
    d = "foo"
}
```

# const

```go
package main 

import "fmt"

func main() {
    const name = "foo"
    name = "bar"
    fmt.Println(name) // error

    const (
        sun = iota // 0
        mon // 1
        tue // 2
    )
    fmt.Println(sun, mon, tue)

}
```


# data type

```go
/*
string      "hello"
int         53
float64     10.2
bool        false true
nil

var s string // ""
var a int // 0
var f bool // false
*/

package main 

import "fmt"

func main() {
    a := 10
    b := 12.3
    c := "foo"
    var d bool
    fmt.Printf("a: %d, b:%f, c:%s, d:%t\n", a, b, c, d)
}
```

# operator

```go
/*
Number + - * / %
String +
Bool AND(&&) OR(||) NOT(!)
*/

package main 

import "fmt"

func main() {
    var x int
    x = 10 % 3
    x += 3
    x++
    fmt.Println(x)

    var s string
    s = "hello " + "world" 
    fmt.Println(s)

    a := true
    b := false
    fmt.Println(a && b)
    fmt.Println(a || b)
    fmt.Println(!a)

}
```

# array

```go
package main 

import "fmt"

func main() {
    var a [5]int // a[0] - a[4]
    a[2] = 3
    a[4] = 10
    fmt.Println(a[2])
    b := [...]int{1, 3, 5}
    fmt.Println(b)
    fmt.Println(len(b))
}
```

# slice

```go
package main 

import "fmt"

func main() {
    a := [5]int{2, 10, 8, 15, 4}
    s := a[2:4] // [8, 15]
    s[1] = 12
    fmt.Println(a)
    fmt.Println(s)
    fmt.Println(len(s))
    fmt.Println(cap(s))
}
```

```
[2 10 8 12 4]
[8 12]
2
3
```

```go
package main 

import "fmt"

func main() {
    // s := make([]int, 3) // [0 0 0]
    s := []int{1, 3, 5}
    // append
    s = append(s, 8, 2, 10)
    // copy
    t := make([]int, len(s))
    n := copy(t, s)
    fmt.Println(s)
    fmt.Println(t)
    fmt.Println(n)
}
```

```
[1 3 5 8 2 10]
[1 3 5 8 2 10]
6
```

# map

```go
package main 

import "fmt"

func main() {
    // m := make(map[string]int)
    // m["foo"] = 200
    // m["bar"] = 300
    m := map[string]int{"foo":100, "bar":200}
    fmt.Println(m)
    fmt.Println(len(m))
    delete(m, "foo")
    fmt.Println(m)
    v, ok := m["bar"]
    fmt.Println(v)
    fmt.Println(ok)
}
```

```
map[bar:200 foo:100]
2
map[bar:200]
200
true
```


# function

```go
package main 

import "fmt"

func f1(p1 string) string {
     msg := "param:" + p1
     return msg
}

func main() {
    fmt.Println(f1("param1"))
}
```

```go
package main 

import "fmt"

func swap(a, b int) (int, int) {
    return b, a
}

func main() {
    fmt.Println(swap(5, 2))

    f := func(a, b int) (int, int) {
        return b, a
    }
    fmt.Println(f(2, 3))

    func(msg string) {
        fmt.Println(msg)
    }("taguchi")

}
```



# fmt.Println()

```go
package main

import (
	"fmt"
)

func main() {
	var var1 string = "str1"
	var var2 = "str2"
	var3 := "str3"
	
	fmt.Println(var1)
	fmt.Println(var2)
	fmt.Println(var3)
}

```

```
str1
str2
str3
```

# fmt.Printf()

```go
package main

import (
	"fmt"
)

func main() {
	var1 := "str1"
	
	fmt.Printf("hello %v\n", var1)
	fmt.Printf("hello %v\n", var1)
}
```

```
hello str1
hello str1
```


# Scanf()

```go
package main

import (
	"fmt"
)

func main() {
	var guess int
	
	fmt.Print("Your guess? ")
	fmt.Scanf("%v", &guess)
	fmt.Printf("Your guess is %v\n", guess)
}
```

```
Your guess? 2
Your guess is 2
```

# if

```go
package main

import (
	"fmt"
)

func main() {
	answer := 6
	var guess int
	
	fmt.Print("Your guess? ")
	fmt.Scanf("%v", &guess)
	
	if answer == guess {
		fmt.Println("Equal")
	}	else if answer > guess {
		fmt.Println("higher")
	} else {
		fmt.Println("lower")
	}
}
```

```
Your guess? 3
higher

Your guess? 9
lower

Your guess? 6
Equal
```

```go
package main

import "fmt"

func main() {
    if score := 43; score > 80 {
        fmt.Println("Great!")
    } else if score > 60 {
        fmt.Println("Good!")
    } else {
        fmt.Println("so so...")
    }
}
```

```
so so...
```


# switch

```go
package main 

import "fmt"

func main() {
    signal := "blue"
    switch signal {
    case "red":
        fmt.Println("Stop")
    case "yellow":
        fmt.Println("Caution")
    case "green", "blue":
        fmt.Println("Go")
    default:
        fmt.Println("wrong signal")
    }
	
	
	score := 82
    switch {
    case score > 80:
        fmt.Println("Great!")
    default:
        fmt.Println("so so ...")
    }
}
```

```
Go
Great!
```




# math/rand

```go
package main

import (
  "fmt"
  "math/rand"
  "time"
)

func main() {
  rand.Seed(time.Now().UnixNano())
  answer := rand.Intn(10) + 1
	var guess int
	
	fmt.Print("Your guess? ")
	fmt.Scanf("%v", &guess)
	
	if answer == guess {
		fmt.Println("Equal")
	}	else if answer > guess {
		fmt.Println("higher")
	} else {
		fmt.Println("lower")
	}
	
	fmt.Printf("The answer is %v\n", answer)
}
```

```
Your guess? 3
Equal
The answer is 3

Your guess? 2
higher
The answer is 9

Your guess? 9
lower
The answer is 4
```


# for

```go
package main 

import "fmt"

func main() {

    for i := 0; i < 10; i++ {
        // if i == 3 { break }
        if i == 3 { continue }
        fmt.Println(i)
    }

    i := 0
    for i < 10 {
        fmt.Println(i)
        i++
    }

    i := 0
    for {
        fmt.Println(i)
        i++
        if i == 3 { break }
    }

}
```


```go
package main

import (
    "fmt"
    "math/rand"
    "time"
)

func main() {
    rand.Seed(time.Now().UnixNano())
    answer := rand.Intn(10) + 1

    for {
        var guess int

        fmt.Print("Your guess? ")
        fmt.Scanf("%v", &guess)
    
        if answer == guess {
            fmt.Println("Equal!")
            break
        } else if answer > guess {
            fmt.Println("higher!")
        } else {
            fmt.Println("lower!")
        }
    }
}
```


```
Your guess? 5
higher!
Your guess? 6
Equal!

Your guess? 9
lower!
Your guess? 1
Equal!
```

# count up

```go
package main

import (
    "fmt"
    "math/rand"
    "time"
)

func main() {
    rand.Seed(time.Now().UnixNano())
    answer := rand.Intn(10) + 1
    count := 0

    for {
        var guess int

        fmt.Print("Your guess? ")
        fmt.Scanf("%v", &guess)
        // count = count + 1
        // count += 1
        count++
    
        if answer == guess {
            fmt.Printf("Equal! It took %v guessed!\n", count)
            break
        } else if answer > guess {
            fmt.Println("The answer is higher!")
        } else {
            fmt.Println("The answer is lower!")
        }
    }
}
```


```
Your guess? 1
The answer is higher!
Your guess? 2
The answer is higher!
Your guess? 3
The answer is higher!
Your guess? 4
The answer is higher!
Your guess? 5
The answer is higher!
Your guess? 6
Equal! It took 6 guessed!
```

# range

```go
package main 

import "fmt"

func main() {
    s := []int{2, 3, 8}
    for i, v := range s {
        fmt.Println(i, v)
    }
    
    for _, v := range s {
        fmt.Println(v)
    }
    
    m := map[string]int{"foo":200, "bar":300}
    for k, v := range m {
        fmt.Println(k, v)
    }
}
```


# structs

```go
package main 

import "fmt"

type user struct {
    name string
    score int
}

func main() {
    u := new(user)
    u.name = "foo"
    u.score = 20

    // or
    
    u := user{"foo", 50}
    
    // or
    u := user{name:"foo", score:50}
    
    fmt.Println(u)
}
```

# method

```go
package main 

import "fmt"

type user struct {
    name string
    score int
}

func (u user) show() {
    fmt.Printf("name:%s, score:%d\n", u.name, u.score)
}

func (u *user) hit() {
    u.score++
}

func main() {
    u := user{name:"foo", score:50}
    // fmt.Println(u)
    u.hit()
    u.show()
}
```

# interface

```go
package main

import "fmt"

type greeter interface {
    greet()
}

type japanese struct {}
type american struct {}

func (j japanese) greet() {
    fmt.Println("Konnnichiwa!")
}
func (a american) greet() {
    fmt.Println("Hello!")
}

func main() {
    greeters := []greeter{japanese{}, american{}}
    for _, greeter := range greeters {
        greeter.greet()
    }
}
```

```go
package main

import "fmt"

func show(t interface{}) {
    Type assertions
    _, ok := t.(japanese)
    if ok {
        fmt.Println("i am japanese")
    } else {
        fmt.Println("i am not japanese")
    }

    // Type Switches
    switch t.(type) {
    case japanese:
        fmt.Println("i am japanese")
    default:
        fmt.Println("i am not japanese")
    }
}

type greeter interface {
    greet()
}

type japanese struct {}
type american struct {}

func (j japanese) greet() {
    fmt.Println("Konnnichiwa!")
}
func (a american) greet() {
    fmt.Println("Hello!")
}

func main() {
    greeters := []greeter{japanese{}, american{}}
    for _, greeter := range greeters {
        greeter.greet()
        show(greeter)
    }
}
```

# goroutine

```go
package main

import (
    "fmt"
    "time"
)

func task1() {
    time.Sleep(time.Second * 2)
    fmt.Println("task1 finished!")
}

func task2() {
    fmt.Println("task2 finished!")
}

func main() {
    go task1()
    go task2()

    time.Sleep(time.Second * 3)
}
```



