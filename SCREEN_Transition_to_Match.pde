void transitionToMatchScreen() {
  if (transition == true) {
    //Paddle Charge initialize at 0 in this block instead of Play block to avoid accidental re-assignments to 0
    paddle1Charge = 0;
    paddle2Charge = 0;
    player1Lives = 3;
    player2Lives = 3;
    //Initialize gamestart
    gameOver = false;

    if (transitionCount >= 0 && transitionCount <= 100) {
      if (transitionSound.isPlaying() != 1) {
        transitionSound.play();
        transitionSound.amp(0.4);
      }
      for (int i = 0; i < particles.length; i++) {
        particles[i].fall();
        particles[i].show();
      }
      fill(255, alpha);
      noStroke();
      rectMode(CORNER);
      rect(0, 0, width, height);
      alpha += 2.3;
      transitionCount ++;
    } 
    if (transitionCount == 100) {
      delay(1000);
    }
    if (transitionCount > 100 && transitionCount <= 160) {
      background(0);
      for (int i = 0; i < stars.length; i++) {
        stars[i].show();
        stars[i].update();
      }
      rectMode(CORNER);
      strokeWeight(5);
      stroke(255);
      fill(0);
      rect(0, 19*height/20, width, 1*height/20);
      rect(0, 0, width, 1*height/20);
      stroke(255, 170);
      line(width/2, height/20, width/2, 2.375*height/20);
      line(width/2, 3.5625*height/20, width/2, 4.75*height/20);
      line(width/2, 5.9375*height/20, width/2, 7.125*height/20);
      line(width/2, 8.3125*height/20, width/2, 9.5*height/20);
      line(width/2, 10.6875*height/20, width/2, 11.875*height/20);
      line(width/2, 13.0625*height/20, width/2, 14.25*height/20);
      line(width/2, 15.4375*height/20, width/2, 16.625*height/20);
      line(width/2, 17.8125*height/20, width/2, 19*height/20);
      strokeWeight(1);
      //Print paddles(with color) and ball in initial spots
      //Prints players' profiles
      //Count Down (no one can move & ball doesnt move)
      paddle1.display(2);
      paddle2.display(2);
      ball.show(1);
      fill(255, alpha);
      rectMode(CORNER);
      rect(0, 0, width, height);
      alpha -= 4.5;
      transitionCount ++;
      if (battle.isPlaying() != 1) {
        battle.play();
        battle.amp(0.7);
      }
    }
    if (transitionCount > 160 && transitionCount <= 220) {
      background(0);
      rectMode(CORNER);
      strokeWeight(5);
      stroke(255);
      fill(0);
      //Bars with names and lives
      rect(0, 19*height/20, width, 1*height/20);
      rect(0, 0, width, 1*height/20);
      stroke(255, 170);
      //Court Lines
      line(width/2, height/20, width/2, 2.375*height/20);
      line(width/2, 3.5625*height/20, width/2, 4.75*height/20);
      line(width/2, 5.9375*height/20, width/2, 7.125*height/20);
      line(width/2, 8.3125*height/20, width/2, 9.5*height/20);
      line(width/2, 10.6875*height/20, width/2, 11.875*height/20);
      line(width/2, 13.0625*height/20, width/2, 14.25*height/20);
      line(width/2, 15.4375*height/20, width/2, 16.625*height/20);
      line(width/2, 17.8125*height/20, width/2, 19*height/20);
      strokeWeight(1);
      for (int i = 0; i < stars.length; i++) {
        stars[i].show();
        stars[i].update();
      }
      rectMode(CORNER);
      strokeWeight(5);
      stroke(255);
      fill(0);
      rect(0, 19*height/20, width, 1*height/20);
      rect(0, 0, width, 1*height/20);
      stroke(255, 170);
      line(width/2, height/20, width/2, 2.375*height/20);
      line(width/2, 3.5625*height/20, width/2, 4.75*height/20);
      line(width/2, 5.9375*height/20, width/2, 7.125*height/20);
      line(width/2, 8.3125*height/20, width/2, 9.5*height/20);
      line(width/2, 10.6875*height/20, width/2, 11.875*height/20);
      line(width/2, 13.0625*height/20, width/2, 14.25*height/20);
      line(width/2, 15.4375*height/20, width/2, 16.625*height/20);
      line(width/2, 17.8125*height/20, width/2, 19*height/20);
      strokeWeight(1);
      paddle1.display(2);
      paddle2.display(2);
      ball.show(1);
      textFont(titleFont);
      textAlign(CENTER);
      textFont(titleFont);
      text("3", width/2, height/2);
      print('3');
      transitionCount++;
    }
    if (transitionCount > 220 && transitionCount <= 260) {
      background(0);
      for (int i = 0; i < stars.length; i++) {
        stars[i].show();
        stars[i].update();
      }
      rectMode(CORNER);
      strokeWeight(5);
      stroke(255);
      fill(0);
      rect(0, 19*height/20, width, 1*height/20);
      rect(0, 0, width, 1*height/20);
      stroke(255, 170);
      line(width/2, height/20, width/2, 2.375*height/20);
      line(width/2, 3.5625*height/20, width/2, 4.75*height/20);
      line(width/2, 5.9375*height/20, width/2, 7.125*height/20);
      line(width/2, 8.3125*height/20, width/2, 9.5*height/20);
      line(width/2, 10.6875*height/20, width/2, 11.875*height/20);
      line(width/2, 13.0625*height/20, width/2, 14.25*height/20);
      line(width/2, 15.4375*height/20, width/2, 16.625*height/20);
      line(width/2, 17.8125*height/20, width/2, 19*height/20);
      strokeWeight(1);
      paddle1.display(2);
      paddle2.display(2);
      ball.show(1);
      textFont(titleFont);
      textAlign(CENTER);
      text("2", width/2, height/2);
      print('2');
      transitionCount++;
    }
    if (transitionCount > 260 && transitionCount <= 300) {
      background(0);
      for (int i = 0; i < stars.length; i++) {
        stars[i].show();
        stars[i].update();
      }
      rectMode(CORNER);
      strokeWeight(5);
      stroke(255);
      fill(0);
      rect(0, 19*height/20, width, 1*height/20);
      rect(0, 0, width, 1*height/20);
      stroke(255, 170);
      line(width/2, height/20, width/2, 2.375*height/20);
      line(width/2, 3.5625*height/20, width/2, 4.75*height/20);
      line(width/2, 5.9375*height/20, width/2, 7.125*height/20);
      line(width/2, 8.3125*height/20, width/2, 9.5*height/20);
      line(width/2, 10.6875*height/20, width/2, 11.875*height/20);
      line(width/2, 13.0625*height/20, width/2, 14.25*height/20);
      line(width/2, 15.4375*height/20, width/2, 16.625*height/20);
      line(width/2, 17.8125*height/20, width/2, 19*height/20);
      strokeWeight(1);
      paddle1.display(2);
      paddle2.display(2);
      ball.show(1);
      textFont(titleFont);
      textAlign(CENTER);
      text("1", width/2, height/2);
      print('1');
      transitionCount++;
    }
    if (transitionCount > 300 && transitionCount <= 330) {
      background(0);
      for (int i = 0; i < stars.length; i++) {
        stars[i].show();
        stars[i].update();
      }
      rectMode(CORNER);
      strokeWeight(5);
      stroke(255);
      fill(0);
      rect(0, 19*height/20, width, 1*height/20);
      rect(0, 0, width, 1*height/20);
      stroke(255, 170);
      line(width/2, height/20, width/2, 2.375*height/20);
      line(width/2, 3.5625*height/20, width/2, 4.75*height/20);
      line(width/2, 5.9375*height/20, width/2, 7.125*height/20);
      line(width/2, 8.3125*height/20, width/2, 9.5*height/20);
      line(width/2, 10.6875*height/20, width/2, 11.875*height/20);
      line(width/2, 13.0625*height/20, width/2, 14.25*height/20);
      line(width/2, 15.4375*height/20, width/2, 16.625*height/20);
      line(width/2, 17.8125*height/20, width/2, 19*height/20);
      strokeWeight(1);
      paddle1.display(2);
      paddle2.display(2);
      ball.show(1);
      textFont(titleFont);
      textAlign(CENTER);
      text("GO!", width/2, height/2);
      print('g');
      transitionCount++;
    }
    if (transitionCount > 330) {
      playGame = true;
      transition = false;
    }
  }
}
