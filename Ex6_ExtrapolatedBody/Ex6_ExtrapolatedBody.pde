// USE THE UP & DOWN ARROW KEYS TO ADJUST VIDEO VISIBILITY!

void setup() {
  size(640, 480, FX2D);
  
  //setupCapture(0);
  setupMovie("theworst.mp4");   
}

void draw() {  
  background(0);
  
  if (videoImg != null) {
    if (openCV == null) {
      setupOpenCV(videoImg);
    } else {
      updateOpenCV(videoImg);
    }
    
    tint(138, 12, 242, 255);
    image(openCV.getSnapshot(), 0, 0);
  } 
  
  surface.setTitle("Quirky Things");
}
