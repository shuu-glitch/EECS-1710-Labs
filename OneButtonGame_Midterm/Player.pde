class Player {
  
  PVector position, accel, velocity;
  float r = 40; // radius of player object
  
  Player() {
    position = new PVector(50,(height - 200));
    velocity = new PVector(0, 20);
    accel = new PVector();
  }


  void applyForce(PVector force) {
    accel.add(force); 
  }
  
  void update() {
    applyForce(gravity); // applies downward gravity
    position.add(velocity); // updates position w/ velocity
    
    if (position.y >= height - 170) {
          position.y = height - 170;
          velocity.mult(0);
    }
   
    velocity.add(accel); // update the velocity as per acceleration
    velocity.limit(4); // capping velocity for smoothness
   
    accel.mult(0);
  }
  
  void show() {
    fill(255, 0, 34);
    stroke(0, 0, 0);
    strokeWeight(2);
    imageMode(CORNER); 
    image(chara, position.x, position.y, r * 2, r * 2);   
  }
}
