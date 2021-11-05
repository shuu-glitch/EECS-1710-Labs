// Code reworked from here: https://openprocessing.org/sketch/1130678
// References used include: https://processing.org/reference/libraries/sound/SoundFile.html,
// especially the isPlaying() ref: https://processing.org/reference/libraries/sound/SoundFile_isPlaying_.html

// Sound credits to Freesound.org, in particular:
// https://freesound.org/people/Modification1089/sounds/274379/ ( reworked in Audacity by me ) and
// https://freesound.org/people/DrkAngl1/sounds/416880/

import processing.sound.*;

SoundFile generalMusic, endingMusic;

String mainText;
ArrayList<TextOption> currentOptions; // allows you to add things to the list within the code without modifying the actual array
TextOption lastChosenOption;

int currentState;

PFont bigFont;
PFont smallFont;

void setup() {
  size(1000, 750);
  noSmooth();
  rectMode(CENTER);
  
  generalMusic = new SoundFile(this, "generalMusic_main.wav");
  endingMusic = new SoundFile(this, "badEnd_music.wav");
  bigFont = createFont("Courier New", 22);
  smallFont = createFont("Courier New", 18);
  
  currentOptions = new ArrayList<TextOption>();
  switchState(0); // start off at the title screen
  
  // Play the theme song on a loop
  generalMusic.loop();
}

void draw() {
  background(0);
  
  textAlign(CENTER); // main text is drawn from the top
  textFont(bigFont);
  text(mainText, width / 2, height / 2, width - 20, 500);
  fill(255);
  
  textAlign(LEFT, BOTTOM);
  textFont(smallFont);
  String optionsText = "";
  for(int i = 0; i < currentOptions.size(); i++) {
    // i = counter, easier way to put it
    optionsText += (i + 1) + ". " + currentOptions.get(i).text + "\n";
  }
  
  text(optionsText, 10, height - 20);
  
  surface.setTitle("NIGHTMARE");
}

void keyPressed() {
  if (key == '1') {
    optionChosen(1);
  }
  else if(key == '2') {
    optionChosen(2);
  }
  else if(key == '3') {
    optionChosen(3);
  }
}

void optionChosen(int optionNum) {
  if((optionNum - 1) < currentOptions.size()) {
    lastChosenOption = currentOptions.get(optionNum - 1);
    switchState(lastChosenOption.nextState);
  }
}
