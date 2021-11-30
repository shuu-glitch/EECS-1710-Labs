void pinkNoise() {
  // Map mouseX from -1.0 to 1.0 for left to right
  noise.pan(map(mouseX, 0, width, -1.0, 1.0));

  // Map mouseY from 0.0 to 0.5 for amplitude
  // (the higher the mouse position, the louder the sound)
  noise.amp(map(mouseY, 0, height, 0.4, 0.0));
}
