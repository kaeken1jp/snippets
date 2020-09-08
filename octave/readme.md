[GNU Octave](https://www.gnu.org/software/octave/)

[Octave for macOS - Octave](https://wiki.octave.org/Octave_for_macOS)

# install

```sh
$ brew install octave

$ octave
GNU Octave, version 5.2.0
Copyright (C) 2020 John W. Eaton and others.
```

# syntax

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


