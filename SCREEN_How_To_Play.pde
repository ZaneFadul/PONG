void howToPlayScreen() {
  if (howToPlay == true) {

    if (b == 1) {
      howToPlay = false;
      titleScreen = true;
      valueFromController = 3;
    }
    background(0);
    for (int i = 0; i < drops.length; i++) {
      drops[i].fall();
      drops[i].show();
    }
    //Bring a small menu with text
    textAlign(CENTER, CENTER);
    textFont(titleFont);
    text("HOW TO PLAY", width/2, 2*height/10);
    textFont(infoFont);
    text("Go to 'START MATCH' and select users!", width/2, 4*height/10, width - width/10, height/12);
    text("Once you have selected two players, press 'PLAY GAME'", width/2, 5*height/10, width - width/10, height/12);
    text("To move the paddle, use the sensors to move up and down.", width/2, 6*height/10, width - width/10, height/12);
    text("Press the ability button to use your ability.", width/2, 7*height/10, width - width/10, height/12);
    text("Most importantly, use the B button to go back to the menu.", width/2, 8*height/10, width - width/10, height/12);
    //prompt player to press B button again to return to main menu
  }
}
