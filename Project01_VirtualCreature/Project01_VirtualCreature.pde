int numEnigma = 1; // number of foxes
int numPrey = 8; // number of ghosts
PImage grassLand; // initialization of background variable

Predator[] eFoxes = new Predator[numEnigma];
Prey[] ghosts = new Prey[numPrey];

void setup() { 
  size(1041, 862, P2D);
  grassLand = loadImage("grassLand.png"); // background image
  
  for (int i=0; i < eFoxes.length; i++) {
    eFoxes[i] = new Predator(random(width), random(height));
  }
  
  for (int i = 0; i < ghosts.length; i++) {
    ghosts[i] = new Prey(random(width), random(height));
  }
  
}

void draw() {
  background(grassLand);
  
  for (int i = 0; i < ghosts.length; i++) {
    ghosts[i].run();
  }
  
  for (int i = 0; i < eFoxes.length; i++) {
    eFoxes[i].run();
  }
}
