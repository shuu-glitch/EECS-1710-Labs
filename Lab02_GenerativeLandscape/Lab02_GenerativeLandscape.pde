/* Code Base Taken From: 
    https://github.com/nshaikhinurov/Processing/tree/master/4.%20Landscape
    ( With slight changes to colour, behaviour, and movement by Lilian Ilodigwe )
*/

import processing.pdf.*;
import gifAnimation.*;

Gif girl;

float[] terrainContour;

color[] forestColors = {
  #e1cef0
  ,#9b46ff
  ,#7e2bc9
  ,#48007c
  ,#3d007c
  ,#200f2c
};

color sun = #ffffff;

color[] palette = forestColors;

int dotsCount;
float scale;
float randomiser;
boolean useSplines;
boolean addSpikes;
float amplitude;
float spikeAmplitude;
float x;
float y;
float easing = 0.05;

void setup(){
  size(1280, 720, P2D);
  dotsCount = (int)(0.5 * width);
  scale = 2;
  randomiser = 0;
  useSplines = false;
  amplitude = 0.5 * height / 720;
  addSpikes = true;
  spikeAmplitude = 10;
  girl = new Gif(this, "girl_running.gif");
  girl.play();
  
  // frameRate(12); for slowing it down if you need to see
  //noLoop();
  
}

void draw(){
  mainDraw();
  
  // for the girl moving across the screen; can't figure out how to make her run though
  imageMode(CENTER);
  image(girl, mouseX, width / 2, 1200, 800);
}

void mainDraw(){
  beginRecord(PDF, "../Landscape.pdf");
  background(0);
  renderSun();
  for (int i = 0; i < palette.length; i++){
    // randomiser = random(1000);
    spikeAmplitude = map(i, 0, palette.length - 1, 3, 20);
    amplitude = map(i, 0, palette.length - 1, 0.3 * height * height / 720, 0.6 * height * height / 720);
    scale = map(i, 0, palette.length - 1, 2.0 * width / 1280, 3.0 * width / 1280);
    generateTerrainContour();

    pushMatrix();
    float targetLevel = map(i, 0, palette.length - 1, 0.5 * height, 0.8 * height);
    offsetToTargetLevel(targetLevel);
    renderLandscape(palette[i]);
    popMatrix();
  }
  
  endRecord();
  
}

// for sun movement
void renderSun(){
  noStroke();
  fill(sun);
  float size = 200;
  float targetX = mouseX;
  float dx = targetX - x;
    x += dx * easing;
  
  float targetY = mouseY;
  float dy = targetY - y; 
    y += dy * easing;

  ellipse(x, y, size, size);
}

void generateTerrainContour(){
  terrainContour = new float[dotsCount];
  for (int i = 0; i < dotsCount; i++)
  {
    float t = map(i, 0, dotsCount - 1, 0, scale);
    float noise = noise(randomiser + t);
    float spike = map(random(1), 0, 1, -spikeAmplitude / 2.0, spikeAmplitude / 2.0);
    float y = map(noise, 0, 1, -amplitude / 2, amplitude / 2);
    if (addSpikes)
      y += spike;
    terrainContour[i] = y;
  }
}

void offsetToTargetLevel(float targetLevel){
  translate(0, targetLevel);
}

void renderLandscape(color fillColor){
  noStroke();
  fill(fillColor);
  beginShape();
  addVertex(0, height);
  addVertex(0, height);
  addVertex(0, terrainContour[0]);
  for (int i = 0; i < dotsCount; i++){
    float x = map(i, 0, dotsCount - 1, 0, width);
    float y = terrainContour[i];
    addVertex(x, y);
  }
  addVertex(width, terrainContour[dotsCount - 1]);
  addVertex(width, height);
  addVertex(width, height);
  endShape(CLOSE);
}

void addVertex(float x, float y){
  if (useSplines)
    curveVertex(x, y);
  else
    vertex(x, y);
}

void mouseMoved() {
  redraw();
}

// every time the program is stopped, then run , the hills will have a different altitude.
