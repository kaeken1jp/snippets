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

## triangle(x1, y1, x2, y2, x3, y3)

![](https://i.gyazo.com/e9e41c8a59cad4a05430a5471c2f0ab1.png)



## rect(a, b, c, d), rect(a, b, c, d, r), rect(a, b, c, d, tl, tr, br, bl)

![](https://i.gyazo.com/6214b07dc730c84959fbf244c9be74a9.png)

## rectMode(MODE)

![](https://i.gyazo.com/54a67c84040dfacdf0ddb62751c10475.png)

```
Modifies the location from which rectangles are drawn by changing the way in which parameters given to rect() are intepreted.

The default mode is rectMode(CORNER), which interprets the first two parameters of rect() as the upper-left corner of the shape, while the third and fourth parameters are its width and height.

rectMode(CORNERS) interprets the first two parameters of rect() as the location of one corner, and the third and fourth parameters as the location of the opposite corner.

rectMode(CENTER) interprets the first two parameters of rect() as the shape's center point, while the third and fourth parameters are its width and height.

rectMode(RADIUS) also uses the first two parameters of rect() as the shape's center point, but uses the third and fourth parameters to specify half of the shapes's width and height.

The parameter must be written in ALL CAPS because Processing is a case-sensitive language.
```

```pde
size(200, 200); // width: 200, height: 200
smooth();
background(255);

//rectMode(CORNER);
//rect(50, 50, 80, 30); // x, y, width, height

//rectMode(CORNERS);
//rect(50, 50, 80, 100); // xy, xy

//rectMode(CENTER);
//rect(50, 50, 80, 100); // center xy, width, height

rectMode(RADIUS);
rect(50, 50, 80, 100); // center xy, dist, dist
```

## ellipse(a, b, c, d)

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


## arc(a, b, c, d, start, stop), arc(a, b, c, d, start, stop, mode)

![](https://i.gyazo.com/4389d8fe13451479d0b66f64a572a5c1.png)

## QUARTER_PI, HALF_PI, PI, TWO_PI

![](https://i.gyazo.com/50e9222fab37e99db1c6ba108f5ddb4b.png)

## degrees(), radians()

```pde
float rad = PI/4;
float deg = degrees(rad);
println(rad + " radians is " + deg + " degrees");

float deg2 = 45.0;
float rad2 = radians(deg2);
println(deg2 + " degrees is " + rad2 + " radians");
```

```
0.7853982 radians is 45.0 degrees
45.0 degrees is 0.7853982 radians
```

![](https://i.gyazo.com/024b38760345d8c6ee193e83ec561937.png)


## drawing order

## attribute

## mode

## color

## shape

## comment

```pde
// comment
```

## others

## smooth()

```
Draws all geometry with smooth (anti-aliased) edges. This behavior is the default, so smooth() only needs to be used when a program needs to set the smoothing in a different way. The level parameter increases the amount of smoothness. This is the level of over sampling applied to the graphics buffer.
```

## background()

```
The background() function sets the color used for the background of the Processing window. The default background is light gray. This function is typically used within draw() to clear the display window at the beginning of each frame, but it can be used inside setup() to set the background on the first frame of animation or if the backgound need only be set once.
```

![](https://i.gyazo.com/b9b39d9fb4018575b9e10d68cdff3edb.png)

