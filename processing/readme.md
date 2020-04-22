[Processing.org](https://processing.org/)

# download & install

[Download \ Processing.org](https://processing.org/download/)

# version

```
3.5.4
```

# extension

```
pde
```

# Sketch

## tips

- shortcut
  - execute: Ctrl + R (Mac)

# sample code

## ellipse()

```pde
ellipse(50, 50, 80, 80);
```

![](https://i.gyazo.com/b933d6818f07599661aa7165aaedc732.png)



```pde
void setup() {
  size(480, 120);
}

void draw() {
  if (mousePressed) {
    fill(0);
  } else {
    fill(255);
  }
    ellipse(mouseX, mouseY, 80, 80);
}
```

![](https://i.gyazo.com/014901c3b38cee796a8ea8e57273589a.png)


## size()

```pde
size(800, 600);
```

## point()

```pde
size(480, 120);
point(240, 60);
```

![](https://i.gyazo.com/58052a6d951ac082f7eee658dda7fd25.png)


## line(x1, y1, x2, y2)

```pde
size(480, 120);
line(20, 50, 420, 110);
```

![](https://i.gyazo.com/341147d2963873d71fe2544faf33e7ed.png)


## quad(x1, y1, x2, y2, x3, y3, x4, y4)

```pde
quad(38, 31, 86, 20, 69, 63, 30, 76);
```

![](https://i.gyazo.com/b4b558aad018d478b28951f677ccf055.png)

