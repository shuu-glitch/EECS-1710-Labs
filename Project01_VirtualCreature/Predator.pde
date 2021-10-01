class Predator {
  boolean debug = true;
  PVector position, target;
  PImage blink, enigma1, enigma2, enigmaShake, enigmaCurrent, timeoutFail;
  float margin = 50;
  int foodChoice;
  
  boolean isBothered = false;
  int botheredMarkTime = 0;
  int botheredTimeout = 3000;
  float botheredSpread = 4;
  
  boolean gameRunning = true;
  int gameMarkTime = 0;
  int gameTimeout = 20000;
  
  boolean isBlinking = false;
  int blinkMarkTime = 0;
  int blinkTimeout = 4000;
  int blinkDuration = 250;
  
  boolean isHunting = false;
  
  float triggerDistance1 = 80;
  float triggerDistance2 = 25;
  float movementSpeed = 0.05;
    
  // CONSTRUCTOR:
  Predator(float x, float y) {
    
    position = new PVector(x, y);
    pickEscapeTarget();
    
    // the images of the enigma's different states
    enigma1 = loadImage("enigma1.png");
    enigma1.resize(enigma1.width/3, enigma1.height/3);
    enigmaShake = loadImage("enigmaShake.png");
    enigmaShake.resize(enigma1.width, enigma1.height);
    enigma2 = loadImage("enigma1.png");
    enigma2.resize(enigma1.width, enigma1.height);
    blink = loadImage("blink.png");
    blink.resize(enigma1.width, enigma1.height);
    
    enigmaCurrent = enigma1;

    timeoutFail = loadImage("loser.png");
  }
  
  void update() {
    PVector mousePos = new PVector(mouseX, mouseY);
    isBothered = position.dist(mousePos) < triggerDistance1;
    
    if (isBothered) {
      isHunting = false;
      botheredMarkTime = millis();
      enigmaCurrent = enigmaShake; // enigma's angry expression
      if (position.dist(target) < triggerDistance2) {
        pickEscapeTarget();
      }
    } else if (!isBothered && millis() > botheredMarkTime + botheredTimeout) {
      if (!isBlinking && millis() > blinkMarkTime + blinkTimeout) {
        isBlinking = true;
        blinkMarkTime = millis();
      } else if (isBlinking && millis() > blinkMarkTime + blinkDuration) {
        isBlinking = false;
      }
  
      if (isBlinking) {
        enigmaCurrent = blink; // in-between blinking state
      } else {
        enigmaCurrent = enigma2; // a neutral expression
      }   
      
      // enigma should head towards ghosts to devour when not being chased.
      if (!isHunting) {
        pickFoodTarget();
        isHunting = true;
      }
    } else if (!isBothered && millis() > botheredMarkTime + botheredTimeout / 6) {
      enigmaCurrent = enigma1; // neutral expression
    }
  
    if (isBothered || isHunting) {
      position = position.lerp(target, movementSpeed).add(new PVector(random(-botheredSpread, botheredSpread), random(-botheredSpread, botheredSpread)));
    }
    
    if (isHunting && position.dist(target) < 5) {
      ghosts[foodChoice].alive = false; 
      pickFoodTarget();
    }
    
    // to check how long the game has lasted
    gameMarkTime = millis();
    
    // once the gameTimeout is greater than 20s, YOU LOSE. there is no way to win lol
    if (millis() > gameTimeout) {
      grassLand = timeoutFail;
      }  
    
    position.y += sin(millis()) / 2;
  }
  
  void draw() {    
    ellipseMode(CENTER);
    rectMode(CENTER);
    imageMode(CENTER);
    
    image(enigmaCurrent, position.x, position.y);

  // FOR DEBUGGING PURPOSES:
    /* if (debug) {
      noFill();
      stroke(0, 255, 0);
      ellipse(position.x, position.y, triggerDistance1*2, triggerDistance1*2);
      ellipse(position.x, position.y, triggerDistance2*2, triggerDistance2*2);
      line(target.x, target.y, position.x, position.y);
      stroke(255, 0, 0);
      rect(target.x, target.y, 10, 10);*/
    }
  
  void run() {
    update();
    draw();
  }

  // for how the enigma selects a point on the screen to escape to
  void pickEscapeTarget() {
    target = new PVector(random(margin, width-margin), random(margin, height-margin));
  }
  
  // for how the enigma selects ghosts to hunt and eat
  void pickFoodTarget() {
    foodChoice = int(random(ghosts.length));
    if (ghosts[foodChoice].alive) {
      target = ghosts[foodChoice].position;
    }
  }
}
