// Code Modified from: https://github.com/OpenGenus/t-rex
// Assets (i.e. background) purchased and owned by me - can be found at https://arludus.itch.io/retro-future-backgrounds-pack
// Character Sprite: https://arks.itch.io/witchcraft-spritesheet?download
// Parallax Code Modified from: https://openprocessing.org/sketch/46976/# @ ramayac, from an older version of Processing

Player kyoshi; // character that jumps over obstacles
PImage back, middle, front, chara; // images for background parts and player model respectively
PVector vback, vmiddle, vfront;

int score = 0; // keeps track of current game's score
int highScore = 0; // keeps track of overall high score
boolean safe = true; // keeps track of whether or not player has hit an obstacle
boolean gameStart = false; // keeps track of whether or not the game is running

PVector gravity = new PVector(0, 0.1); // pushes the player back down to the ground
ArrayList<Enemy> barriers = new ArrayList<Enemy>(); // list of obstructions
int wid = 1100; //The width of our screen

void setup() {
  back = loadImage("background/backbg.png");
  middle = loadImage("background/middlebg.png");
  front = loadImage("background/frontbg.png");
  
  size(1100, 400); //Initialise a canvas
  vback = new PVector(0, 0);
  vmiddle = new PVector(0, 0);
  vfront = new PVector(0, 5); // fixing the position of the image
  
  kyoshi = new Player(); //initialise a player
  chara = loadImage("playerAssets/littleWitch.gif"); //Load the image in the variable
  
}

void paraDraw(PImage img, PVector pos, float vel) {
  pos.sub(vel, 0, 0);
  
  int r = (int)pos.x + img.width;

  if (r < width) image(img, r, pos.y);
  if (pos.x < width) image(img, pos.x - img.width, pos.y);  
  if (pos.x < -img.width) pos.x = width;
  
  image(img, pos.x, pos.y);
}

void draw() {
/* add barriers at random distances - such that minimum distance is 60 frames - to 
make the game playable only if the game is in progress. */
  if (gameStart) {
     if (random(1) < 0.5 && frameCount % 60 == 0) {
          barriers.add(new Enemy()); 
     }
  }
    
   // CONTROLS: 
   if (keyPressed) { // when you try to set it to a single key it just continously jumps
      gameStart = true; // start the game by pressing the key ( and sometimes clicking on the screen itself )
      if (kyoshi.position.y == height - 170) {
          // jump only if the player is already on the ground
          PVector up = new PVector(0, -100); // defining an appropriate upward force
          kyoshi.applyForce(up); // applying the upward force just defined
      }
   }
  
   background(back);
   paraDraw(middle, vmiddle, 0.3);
   paraDraw(front, vfront, 2);
   kyoshi.update();
   kyoshi.show();

   // traverse and display the obstructions
   for (int i = barriers.size() - 1; i >= 0; i--) {
      Enemy p = barriers.get(i);
      p.update();
        
      if (p.hits(kyoshi)) {
         p.show(true);
         safe = false;
      } else {
         p.show(false);
         safe = true;
      }
        
      // remove the obstacles that went out of frame
      if (p.x < -p.w) {
         barriers.remove(i);
      }
  }
  
  if (safe && gameStart) {
      score++;
  } else {
     // restart the game
     score = 0;
     text("CLICK TO START!", width / 2 - 500, 50);
     gameStart = false; 
  }
    
  fill(255); // text colour for score
  textSize(32); // text size for score
    
  // display score
  text("Score: ", width / 2 - 100, 50);
  text(score, width / 2, 50);
    
  // set and display high score
  if (highScore < score) {
    highScore = score;
  }
    
  text(highScore, width / 2 + 310, 50);
  text("High Score: ", width / 2 + 300 - 170, 50);
  
  surface.setTitle("Night Runner");
}
