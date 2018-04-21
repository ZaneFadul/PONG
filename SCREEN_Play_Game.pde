void playGameScreen() {
  if (playGame == true) {
    if (transitionSound.isPlaying() == 1) {
      transitionSound.stop();
    }
    if (gameOver != true) {
      background(0);
      stroke(255, 170);
      line(width/2, height/20, width/2, 2.375*height/20);
      line(width/2, 3.5625*height/20, width/2, 4.75*height/20);
      line(width/2, 5.9375*height/20, width/2, 7.125*height/20);
      line(width/2, 8.3125*height/20, width/2, 9.5*height/20);
      line(width/2, 10.6875*height/20, width/2, 11.875*height/20);
      line(width/2, 13.0625*height/20, width/2, 14.25*height/20);
      line(width/2, 15.4375*height/20, width/2, 16.625*height/20);
      line(width/2, 17.8125*height/20, width/2, 19*height/20);

      for (int i = 0; i < stars.length; i++) {
        stars[i].show();
        stars[i].update();
      }

      //Ball starts with Bouncy" code, random direction but,
      //changes direction only by hitting top and bottom, and paddles
      //triggers a switch when it collides with walls of the screen
      //Paddles can freely move, based on the info that distance sensors will be sending,
      //distance sensors will read either 1, or -1, the corresponding directions up, stop, and down
      paddle1.display(player1Values);
      paddle2.display(player2Values);
      //since ball.display actually returns values, 1 and 2 values are used to increment paddle charge
      ballValues = ball.display();
      incrementCharge(ballValues);

      //with each paddle collision, players will build up an "ability charge"
      //about 10 hits for ability
      //ability will be saved and not increase when full
      //ability will vary depending on paddles color
      //Checks if the paddle is fully charged
      if (paddle1Charge == 10 && player1Ability == 1) {
        abilityTimer1 = 0;
        paddle1Charge = 0;
        ability1Used = true;
      }
      //Checks the types of abilities the paddle can perform based on color
      /*
       -Ball Speed Increase ^
       -Paddle Speed Increase
       -Paddle distance Change
       -Paddle color change
       */
      if (ability1Used == true) {
        if (abilityUsed.isPlaying() != 1) {
          abilityUsed.play();
          ability.play();
          abilityUsed.amp(0.4);
        }
        switch(paddle1.getColor()) {
        case 1:
          //White Ability
          if (abilityTimer1 <= 200) {
            ball.setSpeed(2);
            ball.setColor(2);
            battle.amp(0);
            spark1 = 0;
            abilityTimer1++;
          }
          if (abilityTimer1 > 200) {
            ball.setSpeed(1);
            ball.setColor(1);
            battle.amp(1);
            abilityTimer1 = 0;
            paddle1Charge = 0;
            abilityUsed.stop();
            ability.stop();
            ability1Used = false;
          }
          break;

        case 2:
          //Red Ability
          if (abilityTimer1 <= 200) {
            paddle1.setSpeed(3);
            battle.amp(0);
            spark1 = 0;
            abilityTimer1++;
          }
          if (abilityTimer1 > 200) {
            paddle1.setSpeed(2);
            battle.amp(1);
            abilityTimer1 = 0;
            paddle1Charge = 0;
            abilityUsed.stop();
            ability.stop();
            ability1Used = false;
          }
          break;

        case 3:
          //Blue Ability
          if (abilityTimer1 <= 200) {
            ball.setSpeed(0.25);
            ball.setColor(2);
            battle.amp(0);
            spark1 = 0;
            abilityTimer1++;
          }
          if (abilityTimer1 > 200) {
            ball.setSpeed(1);
            ball.setColor(1);
            battle.amp(1);
            abilityTimer1 = 0;
            paddle1Charge = 0;
            abilityUsed.stop();
            ability.stop();
            ability1Used = false;
          }
          break;

        case 4:
          //Purple Ability
          if (paddle2.getColor() != 666) {
            paddle2TempColor = paddle2.getColor();
          }
          if (abilityTimer1 <= 100) {
            paddle2.setColor(666);
            battle.amp(0);
            spark1 = 0;
            abilityTimer1++;
          }
          if (abilityTimer1 > 100) {
            paddle2.setColor(paddle2TempColor);
            battle.amp(1);
            abilityTimer1 = 0;
            paddle1Charge = 0;
            abilityUsed.stop();
            ability.stop();
            ability1Used = false;
          }
          break;

        case 5:
          //Green Ability
          if (abilityTimer1 <= 200) {
            paddle2.setSpeed(1);
            battle.amp(0);
            spark1 = 0;
            abilityTimer1++;
          }
          if (abilityTimer1 > 200) {
            paddle2.setSpeed(2);
            battle.amp(1);
            abilityTimer1 = 0;
            paddle1Charge = 0;
            abilityUsed.stop();
            ability.stop();
            ability1Used = false;
          }
          break;

        case 666: //if the user uses an ability while corrupted
          spark1 = 0;
          paddle1Charge = 0;
          ability1Used = false;
          //abilityUsed.stop();
          //ability.stop();
          break;
        }
      }

      if (paddle2Charge == 10 && player2Ability == 1) {
        paddle2Charge = 0;
        abilityTimer2 = 0;
        ability2Used = true;
      }  

      if (ability2Used == true) {
        if (abilityUsed.isPlaying() != 1) {
          abilityUsed.play();
          ability.play();
          abilityUsed.amp(0.4);
        }
        switch(paddle2.getColor()) {
        case 1:
          //White Ability
          if (abilityTimer2 <= 200) {
            ball.setSpeed(2);
            ball.setColor(2);
            battle.amp(0);
            spark2 = 0;
            abilityTimer2++;
          }
          if (abilityTimer2 > 200) {
            ball.setSpeed(1);
            ball.setColor(1);
            battle.amp(1);
            abilityTimer2 = 0;
            paddle2Charge = 0;
            abilityUsed.stop();
            ability.stop();
            ability2Used = false;
          }
          break;

        case 2:
          //Red Ability
          if (abilityTimer2 <= 200) {
            paddle2.setSpeed(3);
            battle.amp(0);
            spark2 = 0;
            abilityTimer2++;
          }
          if (abilityTimer2 > 200) {
            paddle2.setSpeed(2);
            battle.amp(1);
            abilityTimer2 = 0;
            paddle2Charge = 0;
            abilityUsed.stop();
            ability.stop();
            ability2Used = false;
          }
          break;

        case 3:
          //Blue Ability
          if (abilityTimer2 <= 200) {
            ball.setSpeed(0.25);
            ball.setColor(2);
            battle.amp(0);
            spark2 = 0;
            abilityTimer2++;
          }
          if (abilityTimer2 > 200) {
            ball.setSpeed(1);
            ball.setColor(1);
            battle.amp(1);
            abilityTimer2 = 0;
            paddle2Charge = 0;
            abilityUsed.stop();
            ability.stop();
            ability2Used = false;
          }
          break;

        case 4:
          //Purple Ability
          if (paddle1.getColor() != 666) {
            paddle1TempColor = paddle1.getColor();
          }
          if (abilityTimer2 <= 100) {
            paddle1.setColor(666);
            battle.amp(0);
            spark2 = 0;
            abilityTimer2++;
          }
          if (abilityTimer2 > 100) {
            paddle1.setColor(paddle1TempColor);
            battle.amp(1);
            abilityTimer2 = 0;
            paddle2Charge = 0;
            abilityUsed.stop();
            ability.stop();
            ability2Used = false;
          }
          break;

        case 5:
          //Green Ability
          if (abilityTimer2 <= 200) {
            paddle1.setSpeed(1);
            battle.amp(0);
            spark2 = 0;
            abilityTimer2++;
          }
          if (abilityTimer2 > 200) {
            paddle1.setSpeed(2);
            battle.amp(1);
            abilityTimer2 = 0;
            paddle2Charge = 0;
            abilityUsed.stop();
            ability.stop();
            ability2Used = false;
          }
          break;

        case 666: //if the user uses an ability while corrupted
          spark2 = 0;
          paddle2Charge = 0;
          abilityUsed.stop();
          ability.stop();
          ability2Used = false;
          break;
        }
      }

      //each player will have 3 lives
      //when ball hits players wall, 
      //they lose a life, ball starts at the beginning of match,
      //with lives changed accordingly
      //since ball.display also returns a 3 or 4 if the outskirts of the map are hit, this will be used
      //to affect players' lives
      if (ballValues == 3 && player1Lives != 0) {
        player1Lives --;
        ball.hide();
        ballOut.play();
        /*for (int i = 0; i < 3000; i++) {
         translate(random(width/5, width/2), random(height/5, width/2));
         }*/
        delay(2000);
        ballOut.stop();
      } else if (ballValues == 4 && player2Lives != 0) {
        player2Lives --;
        ball.hide();
        ballOut.play();
        /*for (int i = 0; i < 3000; i++) {
         translate(random(width/5, width/2), random(height/5, width/2));
         }*/
        delay(2000);
        ballOut.stop();
      }

      //Print Users (GUI)
      rectMode(CORNER);
      strokeWeight(5);
      stroke(255);
      fill(0);
      rect(0, 19*height/20, width, 1*height/20);
      rect(0, 0, width, 1*height/20);
      strokeWeight(1);
      textAlign(CENTER);
      textFont(infoFont);
      fill(255);
      text(selectUser1Button.getButtonName(), width/40, 0.1*height/20, width/10, height/20);
      text(selectUser2Button.getButtonName(), width/40, 19.1*height/20, width/10, height/20);

      //Print Graphics for Ability and Lives
      abilityBar1(paddle1Charge, spark1);
      abilityBar2(paddle2Charge, spark2);
      printP1Lives(player1Lives, paddle1.getColor());
      printP2Lives(player2Lives, paddle2.getColor());

      //Print Ability Names
      if (paddle1Charge == 10) {
        switch(paddle1.getColor()) {
        case 1:
          textAlign(CORNER);
          fill(255);
          text("BALLBOOST", 3.3*width/4, 3*height/80);
          break;

        case 2:
          textAlign(CORNER);
          fill(255);
          text("PADDLEBOOST", 3.3*width/4, 3*height/80);
          break;

        case 3:
          textAlign(CORNER);
          fill(255);
          text("CHILL OUT", 3.3*width/4, 3*height/80);
          break;

        case 4:
          textAlign(CORNER);
          fill(255);
          text("CORRUPT", 3.3*width/4, 3*height/80);
          break;

        case 5:
          textAlign(CORNER);
          fill(255);
          text("SLOWPADDLE", 3.3*width/4, 3*height/80);
          break;

        case 666:
          textAlign(CORNER);
          fill(255);
          text("CORRUPTED", 3.3*width/4, 3*height/80);
          break;
        }
      }

      if (paddle2Charge == 10) {
        switch(paddle2.getColor()) {
        case 1:
          textAlign(CORNER);
          fill(255);
          text("BALLBOOST", 3.3*width/4, 79*height/80);
          break;

        case 2:
          textAlign(CORNER);
          fill(255);
          text("PADDLEBOOST", 3.3*width/4, 79*height/80);
          break;

        case 3:
          textAlign(CORNER);
          fill(255);
          text("CHILL OUT", 3.3*width/4, 79*height/80);
          break;

        case 4:
          textAlign(CORNER);
          fill(255);
          text("CORRUPT", 3.3*width/4, 79*height/80);
          break;

        case 5:
          textAlign(CORNER);
          fill(255);
          text("SLOWPADDLE", 3.3*width/4, 79*height/80);
          break;

        case 666:
          textAlign(CORNER);
          fill(255);
          text("CORRUPTED", 3.3*width/4, 79*height/80);
          break;
        }
      }


      //when one has 0 lives,
      if (player1Lives == 0) {
        ball.hide();
        endGameTimer = 0;
        gameOver = true;
      }
      if (player2Lives == 0) {
        ball.hide();
        endGameTimer = 0;
        gameOver = true;
      }
    }


    //*****************************************************************************GAME OVER
    if (gameOver == true) {
      ability.stop();
      battle.stop();
      if (win.isPlaying() != 1) {
        win.play();
        win.amp(0.7);
      }
      if (endGameTimer <= 500) {
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
        textAlign(CENTER);
        textFont(infoFont);
        fill(255);
        text(selectUser1Button.getButtonName(), width/40, 0.1*height/20, width/10, height/20);
        text(selectUser2Button.getButtonName(), width/40, 19.1*height/20, width/10, height/20);
        strokeWeight(1);
        //"Username wins!"
        abilityBar1(paddle1Charge, spark1);
        abilityBar2(paddle2Charge, spark2);
        printP1Lives(player1Lives, paddle1.getColor());
        printP2Lives(player2Lives, paddle2.getColor());
        paddle1.show(width/36, height/2);
        paddle2.show(34*width/36, height/2);

        //Print Ability Names
        if (paddle1Charge == 10) {
          switch(paddle1.getColor()) {
          case 1:
            textAlign(CORNER);
            fill(255);
            text("BALLBOOST", 3.3*width/4, 3*height/80);
            break;

          case 2:
            textAlign(CORNER);
            fill(255);
            text("PADDLEBOOST", 3.3*width/4, 3*height/80);
            break;

          case 3:
            textAlign(CORNER);
            fill(255);
            text("CHILL OUT", 3.3*width/4, 3*height/80);
            break;

          case 4:
            textAlign(CORNER);
            fill(255);
            text("CORRUPT", 3.3*width/4, 3*height/80);
            break;

          case 5:
            textAlign(CORNER);
            fill(255);
            text("SLOWPADDLE", 3.3*width/4, 3*height/80);
            break;

          case 666:
            textAlign(CORNER);
            fill(255);
            text("CORRUPTED", 3.3*width/4, 3*height/80);
            break;
          }
        }

        if (paddle2Charge == 10) {
          switch(paddle2.getColor()) {
          case 1:
            textAlign(CORNER);
            fill(255);
            text("BALLBOOST", 3.3*width/4, 79*height/80);
            break;

          case 2:
            textAlign(CORNER);
            fill(255);
            text("PADDLEBOOST", 3.3*width/4, 79*height/80);
            break;

          case 3:
            textAlign(CORNER);
            fill(255);
            text("CHILL OUT", 3.3*width/4, 79*height/80);
            break;

          case 4:
            textAlign(CORNER);
            fill(255);
            text("CORRUPT", 3.3*width/4, 79*height/80);
            break;

          case 5:
            textAlign(CORNER);
            fill(255);
            text("SLOWPADDLE", 3.3*width/4, 79*height/80);
            break;

          case 666:
            textAlign(CORNER);
            fill(255);
            text("CORRUPTED", 3.3*width/4, 79*height/80);
            break;
          }
        }

        if (player1Lives == 0) {
          textAlign(CENTER);
          textFont(titleFont);
          fill(255);
          text(selectUser2Button.getButtonName() + "  WINS!", width/2, height/2);
        }
        if (player2Lives == 0) {
          textAlign(CENTER);
          textFont(titleFont);
          fill(255);
          text(selectUser1Button.getButtonName() + "  WINS!", width/2, height/2);
          //User's amount of wins goes up
        }
        endGameTimer += 1;
      }

      if (endGameTimer >  500) {
        if (player1Lives == 0) {
          //User's amount of wins goes up
          for (int i = 0; i < userList.length; i++) {
            try {
              if (selectUser2Button.getButtonName() == userList[i].getUsername()) {
                userList[i].addRank();
              }
            }
            catch (Exception e) {
            }
          }
        }
        if (player2Lives == 0) {
          for (int i = 0; i < userList.length; i++) {
            try {
              if (selectUser1Button.getButtonName() == userList[i].getUsername()) {
                userList[i].addRank();
              }
            }
            catch (Exception e) {
            }
          }
        }
        //SAVES USER STATS
        userDatabase = createWriter("userdata.txt");
        for (int i = 0; i < userList.length; i++) {
          try {
            userListStrings[i] = userList[i].getUsername() + ',' + str(userList[i].getRank()) + ',' + str(userList[i].getPreferredColor());
          }
          catch (Exception e) {
            userListStrings[i] = "";
          }
        }
        saveStrings("userdata.txt", userListStrings);

        //Fix any glitches during game
        paddle1.setSpeed(2);
        paddle2.setSpeed(2);
        ball.setSpeed(1);
        ball.setColor(1);
        battle.rate(1);
        abilityTimer1 = 0;
        abilityTimer2 = 0;
        paddle1Charge = 0;
        paddle2Charge = 0;

        //Returns to Main Menu
        paddle1.show(width/36, height/2);
        paddle2.show(34*width/36, height/2);
        delay(1000);
        win.stop();
        playGame = false;
        titleScreen = true;
        valueFromController = 0;
        endGameTimer = 0;
      }
    }
  }
}
