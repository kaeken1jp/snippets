
# hello world

```go
package main

import (
  "fmt"
)

func main() {
  fmt.Println("Hello World")
}
```

# string

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

# variable

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



