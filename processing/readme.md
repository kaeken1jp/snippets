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

# Sample code

## variables

```pde
String s = "str"; // string
println(s);
char c = 'a'; // // Declare variable 'c' of type char // Assign 'c' the value "a"
println(c);
int i = 23;          // Declare variable 'i' of type int & Assign 'i' the value 23
println(i);
float f = 1.5387;           // Declare variable 'f' of type float & Assign 'f' the value 1.5387
println(f);
boolean b = false; // 	Datatype for the Boolean values true and false.
println(b);
```

## string

```pde
String s1 = "s1";
String s2 = "s2";
println(s1 + s2); // s1s2

////////////////
String na = "";
String str = "string";
int i = 1;
float f = 9.9;
println(na + i + str + f); // 1string9.9

//////////////////////
String str1 = "aaa";
String str2 = "aaa";
if (str1.equals(str2)){
  println(str1 + " equals " + str2);
}else{
  println(str1 + " doesn't equal " + str2);
}
// aaa equals aaa

str2 = "bbb";
if (str1.equals(str2)){
  println(str1 + " equals " + str2); 
}else{
  println(str1 + " doesn't equal " + str2);
}
// aaa doesn't equal bbb
```


## size()

![](https://i.gyazo.com/e499b3f5a8d43ca6fe4f7654278fda7b.png)

```pde
//size(width, height)
//size(width, height, renderer)
size(100, 10);
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

```	
a	float: x-coordinate of the rectangle by default
b	float: y-coordinate of the rectangle by default
c	float: width of the rectangle by default
d	float: height of the rectangle by default
```

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
```
a	float: x-coordinate of the ellipse
b	float: y-coordinate of the ellipse
c	float: width of the ellipse by default
d	float: height of the ellipse by default
```

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


## ellipseMode()

![](https://i.gyazo.com/0059aa515d05bcb918fa941e85929668.png)

```pde
ellipseMode(RADIUS);  // Set ellipseMode to RADIUS
ellipseMode(CENTER);  // Set ellipseMode to CENTER
ellipseMode(CORNER);  // Set ellipseMode is CORNER
ellipseMode(CORNERS);  // Set ellipseMode to CORNERS
```




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

## fill() // color

![](https://i.gyazo.com/df08b74283aa0a7c15624efb95e88ddd.png)

```
	Sets the color used to fill shapes. For example, if you run fill(204, 102, 0), all subsequent shapes will be filled with orange. This color is either specified in terms of the RGB or HSB color depending on the current colorMode(). The default color space is RGB, with each value in the range from 0 to 255.

When using hexadecimal notation to specify a color, use "#" or "0x" before the values (e.g., #CCFFAA or 0xFFCCFFAA). The # syntax uses six digits to specify a color (just as colors are typically specified in HTML and CSS). When using the hexadecimal notation starting with "0x", the hexadecimal value must be specified with eight characters; the first two characters define the alpha component, and the remainder define the red, green, and blue components.

The value for the "gray" parameter must be less than or equal to the current maximum value as specified by colorMode(). The default maximum value is 255.

To change the color of an image or a texture, use tint().
```

```pde
size(200, 200);
smooth();
background(255);

// color
// 0-255 127
// RGB 255, 0, 0
// #ff0000

// fill(#ff0000, 127);

//colorMode(HSB);
//colorMode(RGB, 100);

//fill(100, 100, 255);
noFill();
rect(50, 50, 80, 30);
```

## noFill()

![](https://i.gyazo.com/6c3d358e40006ebcf37ec891f8030078.png)

```pde
rect(15, 10, 55, 55);
noFill();
rect(30, 20, 55, 55);
```

## colorMode()

![](https://i.gyazo.com/7dad318774b23324129e835cde87a7b8.png)

```pde
colorMode(mode)
colorMode(mode, max)
colorMode(mode, max1, max2, max3)
colorMode(mode, max1, max2, max3, maxA)
```

## background()


## stroke() // border color

![](https://i.gyazo.com/99f6c523fb040846b30ce3ca82a7542d.png)

```
Sets the color used to draw lines and borders around shapes. This color is either specified in terms of the RGB or HSB color depending on the current colorMode(). The default color space is RGB, with each value in the range from 0 to 255.

When using hexadecimal notation to specify a color, use "#" or "0x" before the values (e.g., #CCFFAA or 0xFFCCFFAA). The # syntax uses six digits to specify a color (just as colors are typically specified in HTML and CSS). When using the hexadecimal notation starting with "0x", the hexadecimal value must be specified with eight characters; the first two characters define the alpha component, and the remainder define the red, green, and blue components.

The value for the gray parameter must be less than or equal to the current maximum value as specified by colorMode(). The default maximum value is 255.

When drawing in 2D with the default renderer, you may need hint(ENABLE_STROKE_PURE) to improve drawing quality (at the expense of performance). See the hint() documentation for more details.
```

```pde
size(200, 200);
smooth();
background(255);

//stroke(#ff0000);
//strokeWeight(3);
noStroke();
fill(127);
rect(50, 50, 80, 30);
```

## noStroke()

![](https://i.gyazo.com/77dbfa3376ac3b52d6902e6b82bec6f0.png)

```pde
size(300,200);
noStroke();
fill(0,154,74);
rect(0,0,100,200);
fill(255,255,255);
rect(100,0,100,200);
fill(218,0,38);
rect(200,0,100,200);
```

## strokeCap()

![](https://i.gyazo.com/dcc61160020e3114450dcedcec84fbcf.png)

```pde
strokeWeight(12.0);
strokeCap(ROUND);
line(20, 30, 80, 30);
strokeCap(SQUARE);
line(20, 50, 80, 50);
strokeCap(PROJECT);
line(20, 70, 80, 70);
```

## strokeJoin()

![](https://i.gyazo.com/1358e89fd5d11f44066b3432582c5445.png)

```pde
strokeJoin(MITER);
strokeJoin(BEVEL);
strokeJoin(ROUND);
```

## strokeWeight()

![](https://i.gyazo.com/067831ce40f6a0c52d972b9c8fb80579.png)

```pde
strokeWeight(1);  // Default
line(20, 20, 80, 20);
strokeWeight(4);  // Thicker
line(20, 40, 80, 40);
strokeWeight(10);  // Beastly
line(20, 70, 80, 70);
```


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

```pde
background(rgb)
background(rgb, alpha)
background(gray)
background(gray, alpha)
background(v1, v2, v3)
background(v1, v2, v3, alpha)
background(image)
```

## vertex()

![](https://i.gyazo.com/540ce0e3e43306dc368ecb4989d70127.png)

```
All shapes are constructed by connecting a series of vertices. vertex() is used to specify the vertex coordinates for points, lines, triangles, quads, and polygons. It is used exclusively within the beginShape() and endShape() functions.

Drawing a vertex in 3D using the z parameter requires the P3D parameter in combination with size, as shown in the above example.

This function is also used to map a texture onto geometry. The texture() function declares the texture to apply to the geometry and the u and v coordinates set define the mapping of this texture to the form. By default, the coordinates used for u and v are specified in relation to the image's size in pixels, but this relation can be changed with textureMode().
```

```pde
size(200, 200);
smooth();
background(255);

stroke(#333333);
fill(#999999);

beginShape();
vertex(100,  20);
vertex(120, 100);
vertex(100,  80);
vertex( 80, 100);
endShape(CLOSE);
```

## loadImage()

![](https://i.gyazo.com/48eca613b089271546fa9f0904b05aac.png)

```
Loads an image into a variable of type PImage. Four types of images ( .gif, .jpg, .tga, .png) images may be loaded. To load correctly, images must be located in the data directory of the current sketch.
```

```pde
size(200, 200);
smooth();
background(255);

PImage img;
img = loadImage("100shiki.jpg");
//image(img, 10, 10, 50, 50);
//tint(#ff0000, 127);
image(img, 10, 10);
//filter(GRAY);
filter(BLUR, 3);
```

## PFont, textFont(), text()

![](https://i.gyazo.com/4b815e06aed03920ddc7b53a95148fff.png)

```
Sets the current font that will be drawn with the text() function. Fonts must be created for Processing with createFont() or loaded with loadFont() before they can be used. The font set through textFont() will be used in all subsequent calls to the text() function. If no size parameter is specified, the font size defaults to the original size (the size in which it was created with the "Create Font..." tool) overriding any previous calls to textFont() or textSize().

When fonts are rendered as an image texture (as is the case with the P2D and P3D renderers as well as with loadFont() and vlw files), you should create fonts at the sizes that will be used most commonly. Using textFont() without the size parameter will result in the cleanest type.
```

```pde
size(200, 200);
smooth();
background(255);

PFont f;
f = createFont("Helvetica", 16, true);

textFont(f, 18);
fill(#00ff00);

text("hello world", 100, 100);
```

## pushMatrix(), popMatrix()

![](https://i.gyazo.com/accb080a488890b8d26ace579b0cdf5b.png)




```pde
size(200, 200);
smooth();
background(255);

fill(#ff0000, 127);
noStroke();
rect(10, 10, 50, 50);

fill(#0000ff, 127);
noStroke();
pushMatrix();
//translate(10, 10);
//rotate(radians(30));
scale(2, 0.5);
rect(10, 10, 50, 50);
popMatrix();
```

## lights(), box(), sphere()

![](https://i.gyazo.com/e7979ea742b9d20da6b05d0176b69aab.png)

```pde
size(200, 200, P3D);
smooth();
background(0);
lights();

// box
// sphere

pushMatrix();
translate(50, 50, 0);
rotateX(radians(30));
rotateY(radians(40));
rotateZ(radians(10));
noStroke();
box(40);
popMatrix();

pushMatrix();
translate(100, 100, -100);
noStroke();
sphere(40);
popMatrix();
```

## setup(), draw(), frameRate(), frameCount

![](https://i.gyazo.com/998b3d303fc7819f255ad5ef744aacdc.gif)

```pde
void setup() {
  size(200, 200);
  smooth();
  background(255);
  
  noStroke();
  fill(#ff0000);
  
  frameRate(10);
}

int x = 0;
int y = 0;

void draw() {
  background(255);
  rect(x, y, 100, 100);
  x++;
  y++;
  println(frameCount);
}
```


## mouseX, mouseY, mousePressed, mousePressed()

![](https://i.gyazo.com/b53d73da155dc81072518c5ccf1917d5.gif)

```pde
void setup() {
  size(200, 200);
  smooth();
  background(255);
  noStroke();
  fill(#ff0000);
}

int r = 100;

void draw() {
  background(255);
//  if (mousePressed) {
//    fill(255);
//  } else {
//    fill(#ff0000);
//  }
  ellipse(mouseX, mouseY, r, r);
}

void mousePressed() {
  r += 5;
}
```

## ControlP5 library

```
menu > Sketch > Import Library > Add Library > ControlP5 > Install
```

![](https://i.gyazo.com/a2844a4cd7d9a0acacc0e2d2e9bc1025.png)

[processing GUI, controlP5](http://www.sojamo.de/libraries/controlP5/#about)



