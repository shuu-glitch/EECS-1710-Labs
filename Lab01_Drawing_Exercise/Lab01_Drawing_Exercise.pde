color bgColor = color(0, 0, 0);
PFont font;

void setup() {
  size(900, 700, P2D); //p2d enables 2D GPU acceleration; should notice a huge speed boost
  background(bgColor);
  font = createFont("Times New Roman", 60);
  textFont(font, 24);
}

void draw() {
  rectMode(CORNER);
  fill(bgColor, 10);
  rect(0, 0, width, height); 
  fill(255);
  text("Wake up.", width/2, height/2);
}

void mouseDragged() {
  ellipseMode(CENTER);
  rectMode(CENTER);
  fill(149, 11, 11);
  stroke(255, 255, 255);
  ellipse(mouseX, mouseY, pmouseX, pmouseY);
}
