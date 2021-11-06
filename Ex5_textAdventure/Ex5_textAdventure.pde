// Code reworked from here: https://openprocessing.org/sketch/1130678
// References used include: https://processing.org/reference/libraries/sound/SoundFile.html,
// especially the isPlaying() ref: https://processing.org/reference/libraries/sound/SoundFile_isPlaying_.html
// the delay ref: https://processing.org/reference/libraries/sound/Delay.html
// and the stringList ref: https://processing.org/reference/StringList.html

// Sound credits to Freesound.org, in particular ( most being reworked in Audacity by me ):
// LINK CREDITS TO THE SOUNDS ARE PLACED IN THE README.TXT FILE!

import processing.sound.*;

StringList choices;
Delay delay;

SoundFile generalMusic, endingMusic, dust, hallwayAmb, lightSwitch, distortion, flowers, ritualKnife, run, computer, button, beeps, lab, papers, vials, laugh;

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
  dust = new SoundFile(this, "mapdust.wav");
  hallwayAmb = new SoundFile(this, "hallwayAmb.wav");
  lightSwitch = new SoundFile(this, "lightSwitch.wav");
  distortion = new SoundFile(this, "distortionSpace.wav");
  flowers = new SoundFile(this, "flowerPicking.wav");
  ritualKnife = new SoundFile(this, "ritualKnife.wav");
  run = new SoundFile(this, "running_og.wav");
  computer = new SoundFile(this, "mainframeBoot.wav");
  button = new SoundFile(this, "buttonPress.wav");
  beeps = new SoundFile(this, "beeps.wav");
  lab = new SoundFile(this, "labEnter.wav");
  papers = new SoundFile(this, "papersRustle.wav");
  vials = new SoundFile(this, "vialsClink.wav");
  laugh = new SoundFile(this, "laughter.wav");
  
  choices = new StringList();
  // println(choices);
  
  delay = new Delay(this);
  
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

void optionChosen(int optionNum) {
  if((optionNum - 1) < currentOptions.size()) {
    lastChosenOption = currentOptions.get(optionNum - 1);
    switchState(lastChosenOption.nextState);
  }
}
