[GNU Octave](https://www.gnu.org/software/octave/)

[Octave for macOS - Octave](https://wiki.octave.org/Octave_for_macOS)

# overview

```
GNU Octave is software featuring a high-level programming language, primarily intended for numerical computations. Octave helps in solving linear and nonlinear problems numerically, and for performing other numerical experiments using a language that is mostly compatible with MATLAB. It may also be used as a batch-oriented language. Since it is part of the GNU Project, it is free software under the terms of the GNU General Public License.
```

[GNU Octave - Wikipedia](https://en.wikipedia.org/wiki/GNU_Octave)


# install

```sh
$ brew install octave

$ octave
GNU Octave, version 5.2.0
Copyright (C) 2020 John W. Eaton and others.
```

# exec

## exec cli

```sh
$ octave
```

```sh
octave:1> c = 12
c =  12
octave:2> disp(c)
 12
octave:3> c
c =  12
```

## exec file 

- make file # .m extension

```sh
$ cat sample.m
c = 12
disp(c)
```

- exec

```sh
$ octave
octave:1> sample
c =  12
 12
```


# syntax

## image

### imfinfo()

[Information about graphics file - MATLAB imfinfo](https://www.mathworks.com/help/matlab/ref/imfinfo.html)

```octave
image_info = imfinfo('image.jpg')
```

- result

```
image_info =

  scalar structure containing the fields:

    Filename = /path/to/file.bmp
    FileModDate =  2-Oct-2017 21:02:42
    FileSize =  173558
    Format = BMP
    FormatVersion = 
    Width =  319
    Height =  539
    BitDepth =  8
    ColorType = indexed
    DelayTime = 0
    DisposalMethod = 
    LoopCount = 0
    ByteOrder = undefined
    Gamma = 0
    Chromaticities = [](1x0)
    Comment = 
    Quality =  75
    ...(snip)...
    ...
```

```octave
image_info.Width
```

- result

```
319
```

## vector

```octave
b = [4; 9; 2] # Column vector
A = [ 3 4 5;
      1 3 1;
      3 5 9 ]
x = A \ b     # Solve the system Ax = b
```

## plot

```octave
x = -10:0.1:10; # Create an evenly-spaced vector from -10..10
y = sin (x);    # y is also a vector
plot (x, y);
title ("Simple 2-D Plot");
xlabel ("x");
ylabel ("sin (x)");
```

![](https://i.gyazo.com/7f55e1e0c3800d910f965d373cdfc11d.png)


