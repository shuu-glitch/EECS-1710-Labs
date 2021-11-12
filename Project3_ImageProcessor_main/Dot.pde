class Dot {

  PVector position, target;
  color col;
  float speed;
  float dotSize;
  boolean ready;
  
  Dot(float x, float y, color _col, PVector _target) {
    position = new PVector(x, y);
    col = _col;
    target = _target;
    speed = 0.01;
    dotSize = 10;
    ready = false;
  }
  
  void update() {
    position.lerp(target, speed);
    ready = position.dist(target) < 5;
  }
  
  void draw() {
    stroke(col);
    strokeWeight(dotSize);
    tint(107, 0, 216); // purple tint
    image(circle, position.x, position.y, 10, 10); // circle image and size
  }
  
  void run() {
    update();
    draw();
  }

}
