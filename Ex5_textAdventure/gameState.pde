void switchState(int nextState) {
  // code for the various states, options, text and everything that makes up the text adventure.
  
  if(nextState == 0) {
    choices.clear();
    
    if (endingMusic.isPlaying()) {
      endingMusic.stop();
      generalMusic.loop();
    }
    
    mainText = "Welcome to your nightmare.";
    currentOptions.clear();
    currentOptions.add(new TextOption("Wake up.", 1));
  }
  else if(nextState == 1) {
    mainText = "You are in a room. It looks like no one has been in here \nfor years, except for you. You swear you can hear \nsomething breathing through the dingy wall behind you, \nwhich inspires you with a healthy dose of fear. \n You sit up. What do you do first?";
    currentOptions.clear();
    currentOptions.add(new TextOption("Look around.", 2));
    currentOptions.add(new TextOption("Go for the exit.", -4)); // BAD END 1
  }
  else if(nextState == 2) {
    dust.play();
    mainText = "You decide to look around the room. \nFrom initial observations, the room has nothing of value; only \ndecayed paper and molded food you would rather starve than eat, \ncurrently. It's damp and chilly, which doesn't alleviate \nyour sense of urgency. There are a few shelves, lined with \ndrying, moth-eaten books. You see a crudely carved out map and \npick it up, but it turns to dust in your hand. Disspirited, \nyou notice that there is nothing else of value in the room, \nbut the growls outside have stopped.";
    currentOptions.clear();
    currentOptions.add(new TextOption("Leave the room.", 3));
  }
  else if(nextState == 3) {
    hallwayAmb.play();
    mainText = "You are now in the hallway. The halls, in contrast \nto the room you were just in, are pristine and blindingly white. \nIt feels more like a private hospital, yet you see no staff or even \npatients wandering about. There are many closed doors, some perhaps \nlocked, but there are two open ones; one on the left side of the hallway \nand one further down the hall on the right side.";
    currentOptions.clear();
    currentOptions.add(new TextOption("Go through the door on the left.", 4));
    currentOptions.add(new TextOption("Walk to the door on the right.", 5));
  }
  else if(nextState == 4) {
    mainText = "You walk to the left door. The room it leads to is \npitch black, and you second-guess your original choice. Do you ...";
    currentOptions.clear();
    currentOptions.add(new TextOption("Attempt to find a light source first?", 6));
    currentOptions.add(new TextOption("Backtrack?", 7 )); // BAD END 2
  }
  else if(nextState == 5) {
    if (generalMusic.isPlaying() || hallwayAmb.isPlaying()) {
      generalMusic.stop();
      hallwayAmb.stop();
      endingMusic.loop();
    }
    
    mainText = "You attempt to enter the room on the right, but \nsomething stops you dead in your tracks the instant your \nfoot passes the doorframe. Looking around, the room is well-lit, and \narguably homier than the rest of the facility has been, \nbut something sinister watches you from the corner. A man, \nwith a smile so wide the skin of his cheeks has ripped, canines \n on full display. His eyes are completely black, yet \nbulging out of his eyesockets. He looks hungry, but you \nhave nothing to give him. Nothing that you're willing to offer, anyway. \nYou try to step back out into the hallway, but he's far \ntoo quick; in an instant, his teeth are on your neck, \ncrushing your windpipe instantly before dragging your lifeless \ncorpse into the room. Maybe poking inside some rooms is NOT a \ngood idea, well-lit or not.";
    currentOptions.clear();
    currentOptions.add(new TextOption("Try again?", 0));
    currentOptions.add(new TextOption("Quit", -3));
  }
  else if(nextState == 6) {
    if (hallwayAmb.isPlaying()) {
      hallwayAmb.stop();
      lightSwitch.play();
    }
    
    mainText = "You bravely stretch your hand out to the darkness, \npalming clumsily alongside the closest wall next to you. A \nlight switch is located, and you promptly flick it. \nIt does comparatively little, but it's enough for you to vaguely see \nSOME of your surroundings. A small altar is positioned near the \nback of the room, with fresh black flowers you cannot identify. \nThe floor is carpeted, with lumps on the ground now \nidentified as kneeling pads closest to it. \nBesides that, the room is empty of anything useful.";
    currentOptions.clear();
    currentOptions.add(new TextOption("Look at the altar more closely.", 8));
    currentOptions.add(new TextOption("Take the flowers and leave.", 9));
  }
  else if(nextState == 7) {
    if (generalMusic.isPlaying() || hallwayAmb.isPlaying()) {
      generalMusic.stop();
      hallwayAmb.stop();
      endingMusic.loop();
    }
    
    mainText = "As you take a half-step back into the hallway, \na feminine voice seems to tut. Somehow, you feel as you are \nbeing morbidly chided for making a mistake, and you shiver. \n\"Coward,\", you hear her say, and you know she is seething. Before \nyou can turn around to see who is speaking, something pierces \nyour abdomen, causing you to let out a gargled cry and sink \nto the floor, dirtying the white with red. \n\"And disgusting, too. You're ruining my brother's home. I'll have \nto work doubly hard to clean your blood out from between the tiles, \nmortal~!\" \nWith that, your eyes close forever, your body failing before \nyou can hear what the woman will say next. \nYou didn't even get to see her face ...";
    currentOptions.clear();
    currentOptions.add(new TextOption("Try again?", 0));
    currentOptions.add(new TextOption("Quit", -3));
  }
  else if(nextState == 8) {
    distortion.play();
    mainText = "You move closer to the altar; the closer you get, \nthe more blurry your vision, and the longer you linger, \nthe sicker you feel. Yet, something compels you to persevere. \nDo you-";
    currentOptions.clear();
    currentOptions.add(new TextOption("Wait patiently by the altar.", 10));
    currentOptions.add(new TextOption("Take the flowers and GET OUT GET OUTGETOUT-.", 9)); // BACK TO 9
  }
  else if(nextState == 9) {
    choices.append("Flowers acquired.");
    
    if(distortion.isPlaying()) distortion.stop();
    flowers.play();
    
    mainText = "You quickly leave the room, flowers in hand. \nThe hallway is clear, and, more noticeably, the right door \nfrom earlier is now shut. When you try to open it, it won't \nbudge. Continuing down the hall to its ending, a flight of stairs \nappears to lead to a large open area. Sounds of whirring and \nmachinery can be heard.";
    currentOptions.clear();
    currentOptions.add(new TextOption("Go down the flight of stairs to see where the noise is coming from.", 17));
  }
  else if(nextState == 10) {
    mainText = "You stay. You stay until your eyes begin to droop, \nuntil your knees hit the prayer mats, and you  wish to drift \naway, to fall asleep and never wake again. Even if you wanted \nto fight it, you don't think you can anymore.";
    currentOptions.clear();
    currentOptions.add(new TextOption("GO TO SLEEP.", 11));
  }
  else if(nextState == 11) {
    mainText = ". . .";
    currentOptions.clear();
    currentOptions.add(new TextOption("WAKE UP.", 12));
    currentOptions.add(new TextOption("Keep sleeping.", 11));
  }
  else if(nextState == 12) {
    if(distortion.isPlaying()) {
      distortion.stop();
    }
    mainText = "When you wake next, the flowers are gone. The \noppressive air is seemingly cleansed, and you feel refreshed. \nStanding up, you see the door to the room has been shut. \nWhat do you do now?";
    currentOptions.clear();
    currentOptions.add(new TextOption("Open the door and leave the room.", 14));
    currentOptions.add(new TextOption("Look around to see if anything else is missing.", 13));
  }
  else if(nextState == 13) {
    choices.append("Ritual knife acquired.");
    
    // KNIFE SOUND EFFECT:
    ritualKnife.play();
    delay.process(ritualKnife, 4);
    delay.time(4);
    
    mainText = "You look around, yet the room is still as dimly lit as you \nremember. Oddly serene, isn't it? Then something glints close to your leg, \nand you glance down at it. There, where you swore your head \nlay not a few moments ago, is a ritual knife sticking into the ground.";
    currentOptions.clear();
    currentOptions.add(new TextOption("Take the knife, and leave.", 14));
    
  }
  else if(nextState == 14) {
    mainText = "Back in the blinding hallway, you look back the way you came. \nThe lights flicker with warnings, and you swear you can see eyes \nwatching your every move. \nIn a distant realm, you can hear voices that speak in \na language you cannot understand, but one phrase is deliberately \nconveyed to you. \n\"Poor, poor unfortunate soul.\"";
    currentOptions.clear();
    currentOptions.add(new TextOption("Run away from the eyes.", 15));
    currentOptions.add(new TextOption("Stare at the eyes. DO NOT MOVE.", 16));
  }
  else if(nextState == 15) {
    run.play();
    mainText = "You take off down the hall, not daring to look back. \nYou don't hear anything pursuing you, but something \ncompels you to keep moving. You almost fall down a long flight of \nstairs in your escape, but you end up in a large sub-floor laboratory.";
    currentOptions.clear();
    currentOptions.add(new TextOption("Look around.", 17));
  }
  else if(nextState == 16) {
    if (generalMusic.isPlaying()) {
      generalMusic.stop();
      endingMusic.loop();
    }
    
    mainText = "You stare at the eyes. They stare back. You continue \nthe lengthy staring contest for some time, and before \nlong, you feel your mind grow tired. It is a different kind of sleep; \none you genuinely dread this time, instead of quietly accept. \nHands grip your mouth, silencing any scream you \nmight have, and you fall back into their grasp. \nIT IS TOO LATE TO DO ANYTHING, NOW.";
    currentOptions.clear();
    currentOptions.add(new TextOption("Try again?", 0));
    currentOptions.add(new TextOption("Quit", -3));
  }
  else if(nextState == 17) {
    computer.play();
    mainText = "You watch as screens start up, updates are applied, and\n various applications are opened, seemingly on their own. The interface \nis alien in origin; you cannot understand what any of it means, \nwhat language it is running, what it WANTS. Is it even alive? \nOut of some morbid curiousity, you get closer - to check it out, \nand a button that glows a dim shade of pink stands out to you.";
    currentOptions.clear();
    currentOptions.add(new TextOption("PRESS THE BUTTON.", 18));
    currentOptions.add(new TextOption("Wait for something to happen.", 19));
    currentOptions.add(new TextOption("Look around.", 20));
  }
  else if(nextState == 18) {
    if (computer.isPlaying()) computer.stop();
    button.play();
    
    mainText = "Against all reason, you press the button. \nBut yet, nothing obvious happens. Instead, the screen \nseems to reconfigure itself to be read in plain human language. \nODD. \n\"HELLO\" displays in bright white text. \"WHAT WOULD YOU \nLIKE TO KNOW?\" What would you like to know?";
    currentOptions.clear();
    currentOptions.add(new TextOption("\"The altar. What did it do to me?\"", 21));
    currentOptions.add(new TextOption("\"What are the flowers for?\"", 22));
    currentOptions.add(new TextOption("\"Where am I?\"", 23));
  }
  else if(nextState == 19) {
    if (generalMusic.isPlaying()) {
      generalMusic.stop();
      endingMusic.loop();
    }
    
    mainText = "You wait. You wait and wait and wait and keep waiting. \nEventually, you look down at you phone to check the \ntime; at the very least, even with no signal \nand minimal battery life, you can do that. Or so you think. \nWhen you check your phone, time seems to be suspended, glitching \nfrantically to reset itself in this liminal-seeming space. \nDespite that, you seem to have aged drastically, becoming \nold and fragile in the time that you've waited here. You \nstare at the computer screen in despair, as you realize it's \nbeen taking your life force. You can only now sit, \nand wait for the foreign tecnology to drain you dry.";
    currentOptions.clear();
    currentOptions.add(new TextOption("Try again?", 0));
    currentOptions.add(new TextOption("Quit", -3));
  }
  else if(nextState == 20) {
    if (beeps.isPlaying()) beeps.stop();
    
    mainText = "You glance over at the neatly-organized files. While it occurs \nto you that reading them could provide you information as to \nwhere you are, you know they won't tell you WHY you're here. \nRegardless, you keep looking over vials and pages until something \nstands out to you: \"EXPERIMENT LOG #0217\".";
    currentOptions.clear();
    currentOptions.add(new TextOption("Read the files.", 28));
    currentOptions.add(new TextOption("Ignore it, and look amongst the vials instead.", 29));
  }
  else if(nextState == 21) {
    mainText = "\"WHY ASK? IT ALMOST SEEMS AS IF YOU ARE CONCERNED OR SOMETHING.\" \nThe computer, at first, is not sympathetic; why would you \nexpect it to be? Yet, as if sensing your frustration, a \nmechanical echo of a laugh comes from its speakers. \n\"WELL, IT PROTECTED YOU. SEEMS LIKE YOUR ACTIONS WERE \nFAVOURABLE, IN HIS EYES. WOULDN'T COUNT ON SUCH LUCK \nTHE LONGER YOU STAY, THOUGH.\" \nThe screen then shuts off, as if saying that no further help \ncould be given. Weird, wasn't it? Typically, technology was \nso reliable outside of here. Here, even a computer could abandon \nyou. So what do you choose to do now?";
    currentOptions.clear();
    currentOptions.add(new TextOption("Look around.", 20));
    currentOptions.add(new TextOption("Leave the lab.", 26));
  }
  else if(nextState == 22) {
    mainText = "\"FLOWERS ...? OH, YOU SAW THOSE. I HOPE SOME \nMORTAL LIKE YOU DIDN'T TRY TO TOUCH THEM OR ANYTHING. \nRATHER NASTY THINGS, THEY ARE. BUT THEY'RE MY MASTERS' \nPRIDE AND JOY. EXTREMELY EFFECTIVE, TOO!\" \nThe computer also seems to let out a robotic hum of glee, \nprompting you to recall ...";
    currentOptions.clear();
    
    if(choices.hasValue("Flowers acquired.")) {
      currentOptions.add(new TextOption("\"...You mean THESE flowers?\"", 24)); // BAD END 3
    } else currentOptions.add(new TextOption("???", -10));
    
    currentOptions.add(new TextOption("\"Ah. I didn't bring them with me. They were gone when I came to.\"", 25));
  }
  else if(nextState == 23) {
    mainText = "\"WHERE YOU ARE ... ? RIGHT, RIGHT ... WELL, YOU MUST HAVE \nBEEN BROUGHT HERE. AGAINST YOUR WILL, I'M SURE. BUT THAT LITTLE \nFACT WON'T MATTER FOR LONG.\" With that, alarms begin to blare, \nand you can hear distinct footsteps echoing from the hall and stairwell.";
    currentOptions.clear();
    currentOptions.add(new TextOption("Run down the nearest exit.", 26));
    if(choices.hasValue("Ritual knife acquired.")) {
      currentOptions.add(new TextOption("Stay and fight.", 27)); // BAD END 4
    } else currentOptions.add(new TextOption("???", -10));
  }
  else if(nextState == 24) {
    if (generalMusic.isPlaying()) {
      generalMusic.stop();
      endingMusic.loop();
    }
    
    mainText = "\"...HOW PITIFUL. GIVE THEM HERE.\" \nMechanical arms come out out nowhere, and take the \nbouquet from you. The computer itself tuts, like a mother berating \ntheir child for a little mistake. \"NOW LOOK AT WHAT YOU'VE \nDONE TO YOURSELF. POOR, POOR UNFORTUNATE SOUL.\" \nWith those words repeating themselves, you find that the \nveins in your arms, starting from your hands and feet, have started \nto turn black, and are rapidly approaching your heart and neck. \nWith a strained cry, you look to the mainframe for answers. \nNo words are spoken anymore, but the words on the screen are \nenough to chill you to the bone. \nONCE THE POISON REACHES YOUR HEART, YOUR SOUL WILL BE HARVESTED.";
    currentOptions.clear();
    currentOptions.add(new TextOption("Try again?", 0));
    currentOptions.add(new TextOption("Quit", -3));
  }
  else if(nextState == 25) {
    beeps.play();
    
    mainText = "\"GOOD FOR YOU, THEN.\" The computer makes an abrupt \nmonotone-beeping noise, before seeming to mutter to itself, \n\"NOT AGAIN!\" and \nbegin the process of shutting down. It seems like \nyou will no longer be able to glean any answers from it.";
    currentOptions.clear();
    currentOptions.add(new TextOption("You start to look around.", 20));
  }
  // BEGINNING OF RAPID FIRE CHOICES / CHASE SCENES THAT LEAD TO FINAL ENDINGS.
  else if(nextState == 26) {
    lab.play();
    
    mainText = "Footsteps finally enter the lab, and looking back, you see that \nthey belong to a bunch of burly men in suits - AT FIRST. \nOne of the men unhinges his jaw, revealing rows of uncannily sharp teeth. \nYou take off down the hall that appears to lead to the \nnorth; you don't know what direction it is in actuality, but you DO \nknow that you must keep moving. \nYou arrive at a crossroads, with two paths before you.";
    currentOptions.clear();
    currentOptions.add(new TextOption("Choose the left path.", 30));
    currentOptions.add(new TextOption("Choose the right path.", 31)); // BAD END 5
  }
  else if(nextState == 27) {
    if (generalMusic.isPlaying() || lab.isPlaying()) {
      generalMusic.stop();
      lab.stop();
      endingMusic.loop();
    }
    
    mainText = "You brandish the ritual knife you picked up from \nthe altar room, and it seems to make your assailants back off. \nHowever, you notice that they aren't unnerved; rather, \nthey appear to be waiting around like a bunch of delinquents \nafter school. But for what? \nSuddenly, the knife in your hand burns HOT, and you scream, \nwishing to let go and nurse your wound. But it is simply that: \nwishful thinking. The pain increases in intensity as your hand \npractically melts sickeningly to the handle, and you just want \nthe agony to end, in any way possible. You try pulling it \noff using your free hand, but it won't budge. You try to knock \nyourself out so you don't have to feel the pain, but that \n only results in more of it. Your only option now \nis to plunge the knife into your chest, which you do so happily.";
    currentOptions.clear();
    currentOptions.add(new TextOption("Try again?", 0));
    currentOptions.add(new TextOption("Quit", -3));
  }
  else if(nextState == 28) {
    papers.play();
    
    choices.append("Files read.");
    
    mainText = "The file reads: \"No physical interaction with [REDACTED] is allowed \nat all. Personnel below executive ranking are forbidden \nto speak to it, for fear of [REDACTED].\" The words are scratched \nout for a bit, then continue. \"Any such interaction must be \nundertaken in liminal spaces such as [DATA EXPUNGED]. All staff \nshould avoid being unguarded within a hundred meters of it.\" \nWithout any titling to the creature or experiment, these warnings \nmake no sense to you, and you aren't sure you even want to \nstick around long enough to read or see for yourself what it is. \nAs you come to this realization, you hear footsteps coming \nfrom the hallway you passed through earlier.";
    currentOptions.clear();
    currentOptions.add(new TextOption("Proceed.", 26));
    currentOptions.add(new TextOption("Look around a little longer.", 29));
  }
  else if(nextState == 29) {
    if (papers.isPlaying()) papers.stop();
    vials.play();
    
    mainText = "You ignore the files now, instead looking towards the section of vials. \nAll their contents are black or dark shades of purple, and \nyou wonder why it's so consistent. One of the vials has \nlabelling that reads, \"FOR YOUR FINAL HOUR\". Do you take it?";
    currentOptions.clear();
    currentOptions.add(new TextOption("Pick up the vial and take it.", -7));
    currentOptions.add(new TextOption("Ignore the vial. YOUR TIME IS UP EITHER WAY.", 26));
    
  }
  else if(nextState == 30) {
    mainText = "The tunnels are indistinguishable from each other, but \nyou have to make a blind guess, for those footsteps get CLOSER \nthe longer you delay. You come to another crossroads, this time with three identical tunnels.";
    currentOptions.clear();
    currentOptions.add(new TextOption("Choose the left path.", 35)); // BAD END 9
    currentOptions.add(new TextOption("Choose the middle path.", 36)); // BAD END 10
    currentOptions.add(new TextOption("Choose the right path.", 37)); // BRANCHING AWAY FROM BAD ENDS - ONLY NORMAL AND TRUE ENDS HENCEFORTH.
  }
  else if(nextState == 31) {
    mainText = "You run down the tunnel, which opens up quickly to an open \nurban space. You laugh to yourself and whisper, \"Freedom!\". \nAt long last, it feels like you're somewhere normal. \nSuddenly, an weight settles on your shoulders; the \nfurther you step, the heavier it becomes - as if warning you \nto turn back. Do you listen? Do you have TIME to?";
    currentOptions.clear();
    currentOptions.add(new TextOption("Ignore the warning. Press on.", 32)); // BAD ENDING 6
    currentOptions.add(new TextOption("Heed the warning, and turn back.", 33)); // BAD ENDING 7
    if(choices.hasValue("Files read.") && choices.hasValue("Mysterious vial acquired.")) {
      currentOptions.add(new TextOption("Drink the mysterious liquid from the vial.", 34)); // BAD ENDING 8
    } else currentOptions.add(new TextOption("???", -10));
  }
  else if(nextState == 32) {
    if (generalMusic.isPlaying()) {
      generalMusic.stop();
      endingMusic.loop();
    }
    
    mainText = "You fail to heed the warning of the very environment you \ncraved to return to. As soon as you take one step further, \na creature that seems to be as tall as the sky itself \n and tinted as dark as the deepest recesses of space steps out in \nfront of you. You can't hear footsteps chasing you anymore, even as \nyou round the corner to your doom. Perhaps you should've stopped. \nMAYBE THEN YOU'D KNOW WHAT YOUR FATE WAS.";
    currentOptions.clear();
    currentOptions.add(new TextOption("Try again?", 0));
    currentOptions.add(new TextOption("Quit", -3));
  }
  else if(nextState == 33) {
    if (generalMusic.isPlaying()) {
      generalMusic.stop();
      endingMusic.loop();
    }
    
    mainText = "Using your better judgement, you manage to stop yourself. \nMaybe if you book it for the tunnels and HOPE that your \npursuers are just slow enough, you can get back to the fork in the \nroad and make the right choice! Maybe. \nBut you yourself know this is impossible. Back in the tunnels, \nyou come face-to-face with your captors, who seem a little surprised \nto see you. Yet, that doesn't stop them from dropping their \nmortal facade, and springing on you with every intent \nto savagely tear you into bits of flesh. \nOOPS!";
    currentOptions.clear();
    currentOptions.add(new TextOption("Try again?", 0));
    currentOptions.add(new TextOption("Quit", -3));
  }
  else if(nextState == 34) {
    if (generalMusic.isPlaying()) {
      generalMusic.stop();
      endingMusic.loop();
    }
    
    mainText = "You remember the vial you picked up, and you think that this \nmoment right here is about to be your final hour if you DON'T do \nsomething, so you pop off the cap and chug the liquid inside without hesitation. \nSurprisingly, it's not bitter or sweet; it just tastes like water. \nConfused, you wait for either your pursuers to show or something else to appear. \nNothing. It seems time itself has stopped, and you're relieved, \nresting on your laurels for but a moment; until you see blood \ndripping from your face to the concrete below. A voice cackles a short \ndistance away, but your vision is just sanguine. \n\"You fool. You drank it too early.\" That's all you hear, before \nhitting the floor abruptly as you succumb to mass organ failure.";
    currentOptions.clear();
    currentOptions.add(new TextOption("Try again?", 0));
    currentOptions.add(new TextOption("Quit", -3));
  }
  else if(nextState == 35) {
    if (generalMusic.isPlaying()) {
      generalMusic.stop();
      endingMusic.loop();
    }
    
    mainText = "As you head further down the path, stone turns to \nforest and dirt rather abruptly, disorienting you momentarily. \nThis doesn't change the fact you must escape, so you continue your \nblind dash for any sort of landmark or hiding spot. In your hurry, \nyou don't see an ill-placed sign that cautions against hunting \ntraps in the area. As such, your ankle trips \na low-hanging wire, and before you can look down to see what \ntripped you up, an arrow skewers your neck, chest and \nhead, killing you almost instantly. \nSHOULD'VE PAID MORE ATTENTION.";
    currentOptions.clear();
    currentOptions.add(new TextOption("Try again?", 0));
    currentOptions.add(new TextOption("Quit", -3));
  }
  else if(nextState == 36) {
    if (generalMusic.isPlaying()) {
      generalMusic.stop();
      endingMusic.loop();
    }
    
    mainText = "The footsteps behind you appear to trail off into nothingness, \nas you outrun your pursuers. Relieved, but cautious, you don't stop. \nGiven the nature of this place you'd found yourself in, who \nknew if they could still be chasing you or not. \nIt's a shame that, whilst exercising such caution, you \nran yourself straight off a cliff into the bottomless pit of space. As \nyou look back up from where you feel, you can see the hallway abruptly \ncuts off, leaving any unfortunate soul in your current predicament. \nTHE FALL WON'T KILL YOU, BUT THE LACK OF OXYGEN IS SURE TO.";
    currentOptions.clear();
    currentOptions.add(new TextOption("Try again?", 0));
    currentOptions.add(new TextOption("Quit", -3));
  }
  else if(nextState == 37) {
    mainText = "You seem to have ran yourself in circles, as you end up back \nin a lab that seems eerily similar to the first. Yet, \nthere is no sentient computer, so you know you must've made \nprogress. You don't bother gleaning over files for information \nanymore, but you realize that you're at a dead end. The \ntunnel continues no further, and the sound of heels, just one pair, \ncan be heard behind you. \n\"So you finally made it. I'll admit, I did not think one of \nmy brother's human tests would progress this far. But \nsuch is the nature of mortals; your drive is something \nlegends seem to emphasize. Unfortunately, I will have to cut \nthat short. Unless you have something you want to give to me?";
    currentOptions.clear();
    if(choices.hasValue("Mysterious vial acquired.")) {
      currentOptions.add(new TextOption("If you have the vial, give her the vial.", 38)); // NORMAL END
    } else currentOptions.add(new TextOption("???", -10));
    
    if(choices.hasValue("Ritual knife acquired.")) {
      currentOptions.add(new TextOption("If you have the ritual knife, give her the ritual knife.", 39)); // TRUE END
    } else currentOptions.add(new TextOption("???", -10));
    
    currentOptions.add(new TextOption("DIE.", -3)); // FORCE QUIT
  }
  // NORMAL END
  else if(nextState == 38) {
    if (generalMusic.isPlaying()) {
      generalMusic.stop();
      endingMusic.loop();
    }
    
    mainText = "\"You're giving me this? Well, I mean, I suppose it's \nonly right you return what you stole.\" The vial is snatched \naway from you, and for some reason, you feel your only hope has \nbeen as well. The woman ingests the vial, glass and all, \nbefore watching you with reptilian eyes that blink every few minutes or so. \nYou feel nervous, spending all this time waiting around for \nsomething overtly terrifying, but nothing comes. It's just you, \nand the woman, standing together in quiet silence. \n\"What's your name? Actually, don't tell me. Makes me \nhave to talk less,\" the woman mutters. You say nothing to that, \nand after a few more minutes, she points to a hole in the wall. \nTHAT WASN'T THERE BEFORE. \n\"Go. Leave before I change my mind. You don't have \nanything else on you that you're not supposed to, right?\"";
    currentOptions.clear();
    currentOptions.add(new TextOption("Answer truthfully if you don't have \"RITUAL KNIFE\".", 40)); // CONTINUE NORMAL END.
    currentOptions.add(new TextOption("Lie if you do have \"RITUAL KNIFE\".", 41)); // CONTINUE TO BAD END
  }
  // TRUE END
  else if(nextState == 39) {
    if (generalMusic.isPlaying()) {
      generalMusic.stop();
      endingMusic.loop();
    }
    
    // GIGGLE SOUND
    laugh.play();
    delay.process(laugh, 10);
    delay.time(8);
    
    mainText = "\"Ah, my knife!\" The woman coos and makes grabby hands \nfor the inanimate object, cradling it to her chest as if \nit were her child. After a few seconds of this, she turns \nher attention back to you, with a warmer smile accompanying \nher next words. \"Thank you. For returning this to me. Now \nI can pay you back in kind.\" Within seconds, she closes the distance, \ndriving the adorned dagger through your chest. Your hands \ngrip feebly at her robes, betrayal in your gaze. She simply shrugs. \"TECHNICALLY, I DIDN'T LIE. THIS IS THE ONLY WAY TO LET YOU OUT.\"";
    currentOptions.clear();
    currentOptions.add(new TextOption("TRUE END: BITTERSWEET RELEASE. Play again?", 0));
    currentOptions.add(new TextOption("Quit", -3));
  }
  else if(nextState == 40) {
    if (generalMusic.isPlaying()) {
      generalMusic.stop();
      endingMusic.loop();
    }
    
    mainText = "The woman nods and steps aside, and you run through, \nleaving the blindingly-white walls, trippy corridors, and eerie \ninhabitants behind. You return to the city, the place you call \nHOME, wondering if this was all just a dream. Suddenly, you wake up. \nYOU'RE RIGHT BACK WHERE YOU STARTED, AND SOMEHOW, YOU \nFEEL AS IF YOUR NIGHTMARE HAS ONLY JUST BEGUN.";
    currentOptions.clear();
    currentOptions.add(new TextOption("NORMAL END: FALSE ESCAPE. Play again?", 0));
    currentOptions.add(new TextOption("Quit", -3));
  }
  else if(nextState == 41) {
    if (generalMusic.isPlaying()) {
      generalMusic.stop();
      endingMusic.loop();
    }
    
    mainText = "\"Mhm ...\" The other seems to take your answer into \nconsideration, leaving you just enough room to slip by - \nor so you think, as you are sliced in two down the middle. \nYour eyes meet hers once more, and she tap her head twice \nwith a sinister smile. \"So typical of mortals. What, did \nyou actually want to keep what was mine to begin with~? \nIN YOUR DREAMS.\"";
    currentOptions.clear();
    currentOptions.add(new TextOption("BAD END: LIAR, LIAR. Play again?", 0));
    currentOptions.add(new TextOption("Quit", -3));
  }
  
// SEPARATE ENDINGS AND GAME STATES GO HERE.
  
  else if(nextState == -7) {
    vials.play();
    choices.append("Mysterious vial acquired.");
    
    mainText = "VIAL ACQUIRED!";
    currentOptions.clear();
    currentOptions.add(new TextOption("Proceed.", 26));
  }
  
  else if(nextState == -4) {
    if (generalMusic.isPlaying()) {
      generalMusic.stop();
      endingMusic.loop();
    }
    
    mainText = "You burst through the door and enter the hallway. Before you \nhave a chance to survey your surroundings, you feel \nyour legs be swept out from underneath you. Literally. \nAs you reach for your legs a short distance away, you find that \nyou have no arms to do so. \nAs a limbless torso, you bleed to death in silence.";
    currentOptions.clear();
    currentOptions.add(new TextOption("Try again?", 0));
    currentOptions.add(new TextOption("Quit", -3));
  }
  else if(nextState == -3) {
    exit(); // the quit function
  }
}
