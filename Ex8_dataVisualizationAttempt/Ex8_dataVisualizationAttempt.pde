// BASE CODE: https://openprocessing.org/sketch/1231316
// meant to replicate a qr code in some form, but spaced for more movement visibility lol

import processing.video.*;
Capture capture;

PImage video;
int stepSize = 25;

void setup() {
  size(640, 480);
  capture = new Capture(this, 640, 480);
  capture.start();
  noStroke();
  fill(0);
  rectMode(CORNER);
  ellipseMode(CORNER);
}

void draw() {
  background(255);
  //image(capture, 0, 0, 320, 240);
  capture.loadPixels();

  for (int y = 0; y < height; y += stepSize) {
    for (int x = 0; x < width; x += stepSize) {
      int i = y * width + x;
      int darkness = (255 - capture.pixels[i * 2]) / 255;
      int radius = stepSize * darkness;

      float type = floor(random(3));
      
      if (type == 0) {
        rect(x, y, radius, radius);
      } else if (type == 1) {
        rect(x, y, radius, radius);
      } else if (type == 2) {
        rect(x, y, radius, radius);
      }
    }
  }
}
