// BASE CODE CREDIT GIVEN TO:
  // https://observablehq.com/@rreusser/instanced-webgl-circles
  // https://openprocessing.org/sketch/748916
// Processing References:
  // https://processing.org/reference/final.html
  // https://processing.org/reference/cursor_.html
  // FILE > EXAMPLES > LIBRARIES > SOUND > SOUNDFILE > SAMPLER
  // FILE > EXAMPLES > LIBRARIES > SOUND > NOISE > PINK
  
  // HEADPHONES ARE RECOMMENDED!

import processing.sound.*;
Sound sounds;
SoundFile[] file;
PinkNoise noise;

final int maxCircleCount = 700, minCircleCount = 100;
final int maxVertexCount = 30, minVertexCount = 3;

int circleCounter, vertexCounter;

int numsounds = 5; // Define the number of samples 
  
// Create an array of values which represent the octaves. 1.0 is playback at normal speed, 0.5 is half and 
// therefore one octave down. 2.0 is double so one octave up.
float[] octave = {0.25, 0.5, 1.0, 2.0, 4.0};
int[] playSound = {1, 1, 1, 1, 1}; // defines how many samples will be played at each trigger event
int trigger; // number in milliseconds for scheduling of new events
int[] posx = {0, 128, 256, 384, 512}; // holds the pixel positions of the rectangles which are drawn each event
PImage mouseCursor;

void setup() {
  size(900, 900); // no P2D, as the program loses its functionality
  
  // Create and start noise generator
  noise = new PinkNoise(this);
  noise.play();
  
  file = new SoundFile[numsounds]; // creates an array of empty soundfiles
  
  // Load 5 soundfiles from a folder in a for loop. By naming the files 1., 2., 3., n.aif it is easy to iterate
  // through the folder and load all files in one line of code.
  for (int i = 0; i < numsounds; i++) {
    file[i] = new SoundFile(this, (i+1) + ".aif");
  }
   
  trigger = millis(); // creates a trigger which will be the basis for our random sequencer.
  
  mouseCursor = loadImage("purplecursor.png");
}

void draw() {
  background(0);
  cursor(mouseCursor, 0, 0);
  translate(width / 2, height / 2);
  
  soundSampler();
  pinkNoise();
  updateCntByMouse();

  for (int ci = 0; ci < circleCounter; ci++) {
    float time = float(frameCount) / 20;
    float thetaC = map(ci, 0, circleCounter, 0, TAU);
    float scale = 300;

    PVector circleCenter = getCenterByTheta(thetaC, time, scale);
    float circleSize = getSizeByTheta(thetaC, time, scale);
    color c = getColorByTheta(thetaC, time);

    stroke(c);
    noFill();
    beginShape();
    for (int vi = 0; vi < vertexCounter; vi++) {
      float thetaV = map(vi, 0, vertexCounter, 0, TAU);
      float x = circleCenter.x + cos(thetaV) * circleSize;
      float y = circleCenter.y + sin(thetaV) * circleSize;
      vertex(x, y);
    }
    endShape(CLOSE);
  }
  
  surface.setTitle("Multi-Coloured Ocean Waves");
}
