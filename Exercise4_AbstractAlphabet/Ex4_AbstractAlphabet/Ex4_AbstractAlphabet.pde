// Help with this idea came from here: https://discourse.processing.org/t/sequential-loop-with-images/6160
PImage[] alphabetImgs = new PImage[26];

void setup() {
  size(900, 900, P2D);
  
  for (int i = 1; i <= 26; i++) {
    alphabetImgs[i - 1] = loadImage(i + ".png");
  }
}

void draw() {
  background(75, 0, 129);
  imageMode(CENTER);
  image(alphabetImgs[frameCount % 26], width / 2, height / 2);
  
  delay(1200); // Learnt via Processing Ref: https://processing.org/reference/delay_.html
}
