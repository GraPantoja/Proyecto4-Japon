import gab.opencv.*;
import processing.video.*;
import java.awt.*;

PImage img;
Capture video;
OpenCV opencv;

void setup() {
  size(1280, 960);
  video = new Capture(this, 1280/2, 960/2);
  opencv = new OpenCV(this, 1280/2, 960/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  img = loadImage("img2.png");  

  video.start();
}

void draw() {
  scale(2);
  opencv.loadImage(video);

  image(video, 0, 0 );

  Rectangle[] caras = opencv.detect();
  println(caras.length);

  for (int i = 0; i < caras.length; i++) {
    println(caras[i].x + "," + caras[i].y);
    image(img, caras[i].x, caras[i].y, caras[i].width, caras[i].height);
  }
}

void captureEvent(Capture c) {
  c.read();
}
