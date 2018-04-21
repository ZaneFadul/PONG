void mainMenuScreen() {
  if (titleScreen == true) {
    if (win.isPlaying() == 1) {
      win.stop();
    }
    playMusic(menu);

    background(0);
    for (int i = 0; i < drops.length; i++) {
      drops[i].fall();
      drops[i].show();
    }
    textAlign(CENTER);
    textFont(infoFont);
    text("©2018 Zane Fadul", width/2, 15*height/16);
    
    pushMatrix();
    translate(0, -height/16);
    //Button Display
    startMatchButton.display();
    addUserButton.display();
    changeUserColorButton.display();
    howToPlayButton.display();

    //vvthese rectangles are over the buttons currently in beta to show they cannot be used
    rectMode(CENTER);
    noStroke();
    fill(255, 70);
    rect(width/2, 5*height/8, width/5, height/12);
    rect(width/2, 6*height/8, width/5, height/12);
    //^^these rectangles are over the buttons currently in beta to show they cannot be used

    if (alpha > 0) {
      noStroke();
      fill(0, alpha);
      rectMode(CORNER);
      rect(0, 0, width, height);
      alpha -= 3;
    } 
    fill(255);
    noStroke();
    ellipse(3.5*width/8, 3*height/10, 3*width/24.8, 3*width/24.8);
    textAlign(CENTER, CENTER);
    textFont(titleFont);
    text('P', 2.5*width/8, 2.8*height/10);
    text('N', 4.55*width/8, 2.8*height/10);
    text('G', 5.5*width/8, 2.8*height/10);
    popMatrix();
    
    controllerCheck(0, 3);

    //Button Selections to different screens
    if (valueFromController == startMatchButton.getButtonIndex() && a == 1) {
      startMatch = true;
      titleScreen = false;
      valueFromController = 4;
      a = 0;
    }
    /*if (valueFromController == addUserButton.getButtonIndex() && a == 1) {
     createUser = true;
     titleScreen = false;
     valueFromController = 0;
     }*/
    /*if (valueFromController == changeUserColorButton.getButtonIndex() && a == 1) {
     changeUserColor = true;
     titleScreen = false;
     valueFromController = 0;
     }*/
    if (valueFromController == howToPlayButton.getButtonIndex() && a == 1) {
      howToPlay = true;
      titleScreen = false;
      valueFromController = 0;
    }
  }
}
