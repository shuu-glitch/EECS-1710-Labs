LetterGenerator lg;
PImage blueTexture, pinkTexture, purpleTexture;
String input = "abcba";

void setup() {
  size(800, 600, P2D);
  
  blueTexture = loadImage("blueTexture.png");
  pinkTexture = loadImage("pinkTexture.png");
  purpleTexture = loadImage("purpleTexture.png");
  
  lg = new LetterGenerator(input, 0, height / 2);
}

void draw() {
  background(255, 178, 254);
  
  lg.run(); 
}
