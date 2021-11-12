PImage cleaver, candy, circle;
ArrayList<Dot> dots;
ArrayList<PVector> targets1, targets2;
int scaler = 2; // will use only every 2nd pixel from the image
int threshold = 200;
boolean imageToggled = false;
color col1, col2;

void setup() {
  size(50, 50, P2D);  
  cleaver = loadImage("cleaver.png"); // place the image you want here and watch the circles try and map it!
  candy = loadImage("candy.png"); // place the image you want here and watch the circles try and map it!
  circle = loadImage("circle.png");
  
  // set the window size to the largest sides of each image
  int w, h;
  if (cleaver.width > candy.width) {
    w = cleaver.width;
  } else {
    w = candy.width;
  }
  
  if (cleaver.height > candy.height) {
    h = cleaver.height;
  } else {
    h = candy.height;
  }
  
  surface.setSize(w, h);
  
  cleaver.loadPixels();
  candy.loadPixels();
  
  targets1 = new ArrayList<PVector>();
  targets2 = new ArrayList<PVector>();
  
  // col1 = color(10, 216, 0, 63);
  // col2 = color(127, 0, 232, 63);
  
  for (int x = 0; x < candy.width; x += scaler) {
    for (int y = 0; y < candy.height; y += scaler) {
      // this translates x and y coordinates into a location in the pixels array
      int loc = x + y * candy.width;
      
      if (brightness(candy.pixels[loc]) > threshold) {
        targets2.add(new PVector(x, y));
      }
    }
  }

  dots = new ArrayList<Dot>();

  for (int x = 0; x < cleaver.width; x += scaler) {
    for (int y = 0; y < cleaver.height; y += scaler) {
      int loc = x + y * cleaver.width;
      
      if (brightness(cleaver.pixels[loc]) > threshold) {
        int targetIndex = int(random(0, targets2.size()));
        targets1.add(new PVector(x, y));
        Dot dot = new Dot(x, y, col1, targets2.get(targetIndex));
        dots.add(dot);
      }
    }
  }
}

void draw() { 
  background(0);
  
  blendMode(ADD);
  
  boolean flipTargets = true;

  for (Dot dot : dots) {
    dot.run();
    if (!dot.ready) flipTargets = false;
  }
  
  if (flipTargets) {
    for (Dot dot : dots) {
      if (!imageToggled) {
        int targetIndex = int(random(0, targets1.size()));
        dot.target = targets1.get(targetIndex);
        // dot.col = col2;
      } else {
        int targetIndex = int(random(0, targets2.size()));
        dot.target = targets2.get(targetIndex);
        // dot.col = col1;
      }
    }
    
    imageToggled = !imageToggled;
  }
    
  surface.setTitle("Lilian's Image Processor");
}
