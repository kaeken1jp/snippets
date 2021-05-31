[FFmpeg](https://ffmpeg.org/)


# install

```sh
brew install ffmpeg
```


```
$ ffmpeg -version
ffmpeg version 4.3.1 Copyright (c) 2000-2020 the FFmpeg developers
```

```
# mov to mp4
ffmpeg -i input.mov output.mp4
```


# video to image

```
# JPEG
ffmpeg -i input.mp4 -f image2 -vcodec mjpeg -qscale 1 -qmin 1 -qmax 1 %05d.jpg

# PNG
ffmpeg -i input.mp4 -f image2 -vcodec png %05d.png
```

