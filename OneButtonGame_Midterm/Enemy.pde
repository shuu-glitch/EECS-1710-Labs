class Enemy {
  float bottom; // height of barriers
  float w = 40; // width of barriers
  float x; // for the x location of the barrier
  float barrier_speed = 3.5; // rate of change in position of barrier
  
  Enemy() {
    bottom = random(150, 160); // set value of height of barrier
    x = wid + w; // increase the x location by width
  }
  
  void update () {
    if (gameStart) {
      x -= barrier_speed; 
    }
  }
  
  // checks for collision / if locations of the player and the pipe is overlapping
  boolean hits(Player kyoshi) {
    return ((kyoshi.position.x > x) && (kyoshi.position.x < (x + wid))) &&  (kyoshi.position.y > (height - bottom - kyoshi.r));

  }
  
  void show(boolean hit) {
    if (gameStart) { // display barriers if game is in progress
       if (hit) {
         // fill bright pink if player hits barrier
         fill(255, 52, 123, 127);
       } else {
         // fill purple normally
         fill(112, 52, 255, 127);
       }
       
       stroke(0, 0, 0);
       strokeWeight(2);
       rect(x, height - bottom, w, bottom - 110);
      
    }    
  }
}
