// Examples and code modified from:
// https://github.com/eecs17xx/eecs1710-2021f/blob/main/Week05/Clock02/Clock02.pde
// https://processing.org/examples/clock.html
// http://learningprocessing.com/examples/chp10/example-10-04-timer

float rotSeconds = 0;
float rotMinutes = 0;
float rotHours = 0;
int lastSecond = 0;
int lastMinute = 0;
int lastHour = 0;

int colorValue = 0;

int clockDiameter = 500;
float lengthSecondHand = 200;
float lengthMinuteHand = 100;
float lengthHourHand = 80;

int cx, cy;
float secondsRadius;

int savedTime;
int totalTime = 1000;
  
void setup() {
  size(800, 600, P2D);
  background(colorValue);
  
  int radius = min(width, height) / 2;
  cx = width / 2;
  cy = height / 2;
  secondsRadius = radius * 0.72;
  
  savedTime = millis();
  textSize(120);
}

void draw() {
  int s = second();
  int m = minute();
  int h = hour();
  
  if (s != lastSecond) {
    rotSeconds = ((float) s / 60) * TWO_PI;
    lastSecond = s;
  }
  
  if (m != lastMinute) {
    rotMinutes = ((float) m / 60) * TWO_PI;  
    lastMinute = m;
  }
  
  if (h != lastHour) {
    rotHours = ((float) h / 12) * TWO_PI;  
    println(h);
    lastHour = h;
  }
  
  fill(104, 0, 180);
  noStroke();
  ellipse(cx, cy, clockDiameter, clockDiameter);
  
  pushMatrix();
  translate(width / 2, height / 2);
  rotate(rotSeconds);
  stroke(255);
  strokeWeight(1);
  line(0, 0, 0, -lengthSecondHand); // edit as needed
  popMatrix();
  
  pushMatrix();
  translate(width / 2, height / 2);
  rotate(rotMinutes);
  stroke(255);
  strokeWeight(2);
  line(0, 0, 0, -lengthMinuteHand); // edit as needed
  popMatrix();
  
  pushMatrix();
  translate(width / 2, height / 2);
  rotate(rotHours);
  stroke(255);
  strokeWeight(4);
  line(0, 0, 0, -lengthHourHand); // edit as needed
  popMatrix();
  
  // Draw the minute ticks
  strokeWeight(4);
  beginShape(POINTS);
    for (int a = 0; a < 360; a+=6) {
      float angle = radians(a);
      float x = cx + cos(angle) * secondsRadius;
      float y = cy + sin(angle) * secondsRadius;
      vertex(x, y);
    }
    
  endShape();
  
  // Calculate how much time has passed
  int passedTime = millis() - savedTime;
  
  // Has 1 second passed?
  if (passedTime > totalTime) {
    println("1 second has passed! Generating new color ...");
    background(random(255), random(255), random(255)); // Color a new background
    savedTime = millis(); // Save the current time to restart the timer!
  }
  
  // neat little things to do alongside the clock
  fill(random(255), 204);
  text("time", mouseX, mouseY); // draw at the coordinates of the cursor
}
