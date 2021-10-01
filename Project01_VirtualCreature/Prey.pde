class Prey {
  PImage ghostPrey, bloodSplatter;
  
  PVector position;
  float sizeVal;
  boolean alive = true;
  
  // CONSTRUCTOR:
  Prey(float x, float y) {
    position = new PVector(x, y);
    sizeVal = random(10, 15);
    
    // ghost and blood images
    ghostPrey = loadImage("ghostPrey.png");
    ghostPrey.resize(ghostPrey.width / 8, ghostPrey.height / 8);
    bloodSplatter = loadImage("blood.png");
    bloodSplatter.resize(bloodSplatter.width / 4, bloodSplatter.height / 4);
  }

  /* If the ghost is alive, it will display as itself. if it is eaten, there will
  only be a blood splatter left behind. */
  
  void draw() {
    if (alive) {
      imageMode(CENTER);
      image(ghostPrey, position.x, position.y);
    } else {
      imageMode(CENTER);
      image(bloodSplatter, position.x, position.y);
    }
  }
  
  void run() {
    draw();
  }
  
}
