void soundSampler() {
    // If the determined trigger moment in time matches up with the computer clock events get triggered.
    
    if (millis() > trigger) {
      // Redraw the background every time to erase old rects
      background(0);
    
      // By iterating through the playSound array we check for 1 or 0, 1 plays a sound and draws a rect,
      // for 0 nothing happens.
    
      for (int i = 0; i < numsounds; i++) {      
        // check which indexes are 1 and 0.
        if (playSound[i] == 1) {
          float rate;
          fill(0);
          noStroke();
          // draw a boundary rect in the positions we defined earlier in posx
          rect(mouseX, 50, 128, 260);
          // choose a random index of the octave array
          rate = octave[int(random(0, 5))];
          // play the soundfile from the array with the respective rate and loop set to false, according to mouse position
          file[i].play(rate, 1.0);
      }
    
      // renew the indexes of playSound so that at the next event the order is different and randomized.
      playSound[i] = int(random(0, 2));
    }
    
    // Create a new triggertime in the future, with a random offset between 200 and 1000 milliseconds
    trigger = millis() + int(random(200, 1000));
  }
}
