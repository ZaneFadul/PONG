void introScreen() {
  if (gameLoaded == false) {
    if (intro.isPlaying() != 1) {
      intro.play();
    }
    if (millis() - startTime < 7600) {
      textAlign(CENTER, CENTER);
      textFont(infoFont);
      fill(255);
      text("Loading User Data...", 4*width/5, 7*height/8);
    }
    if (millis() - startTime > 7600) {
      userData = loadStrings("userdata.txt");
      if (userData != null) {
        background(0);
        for (int i =  0; i < userData.length; i++) {
          String tempUserLine = userData[i];
          String[] tempUserData = newUserFromString(tempUserLine);
          try {
            userList[i] = new User(tempUserData[0], int(tempUserData[1]), int(tempUserData[2]));
          }
          catch (Exception e) {
            print("");
          }
        }
        printArray(userList);
        println("User Data loaded."); //Console Print for testing
        text("User Data loaded.", 4*width/5, 7*height/8);
        gameLoaded = true;
      } else {
        background(0);
        println("User Data not found. Creating new file."); //Console Print for testing
        text("User Data not found.", 4*width/5, 7*height/8);
        text("Creating new file.", 4*width/5, 7.25*height/8);
        userDatabase = createWriter("userdata.txt");
        userDatabase.flush();
        //userDatabase.close(); //I HAVE QUESTIONS ABOUT THIS
        userData = loadStrings("userdata.txt");
        gameLoaded = true;
      }
    }
  }

  //Intro Sequence to Game
  if (gameIntro == false && gameLoaded == true) {

    if (a == 1) {
      gameIntro = true;
      titleScreen = true;
      alpha = 255;
      intro.stop();
      valueFromController = 0;
      a = 0;
    }
    if (dotT < 800) {
      stroke(255);
      strokeWeight(5);
      translate(width/2, height/2);
      point(dotX(dotT), dotY(dotT));
      dotT += 4;
      alpha = 0;
    }
    if (alpha < 255 && dotT >= 800) {
      noStroke();
      fill(255, alpha);
      ellipse(width/2, height/2, 2*heightPixels/5, 2*heightPixels/5);
      alpha += 0.3;
    }
    if (alpha > 40 && alpha < 60) {
      background(255);
      fill(0);
      ellipse(width/2, height/2, 2*heightPixels/5, 2*heightPixels/5);
    }
    if (alpha > 50 && alpha < 70) {
      background(0);
      fill(255);
      ellipse(width/2, height/2, 2*heightPixels/5, 2*heightPixels/5);
    }
    if (alpha > 60 && alpha < 80) {
      background(255);
      fill(0);
      ellipse(width/2, height/2, 2*heightPixels/5, 2*heightPixels/5);
    }
    if (alpha > 100 && beginTitle != true) {
      alpha = 255;
      beginTitle = true;
      background(255);
      delay(2000);
    }
    if (beginTitle == true && scaleBall < 25) {
      background(0);
      fill(255);
      ellipse(3.5*width/8, 3*height/10, 3*width/scaleBall, 3*width/scaleBall);
      scaleBall += 0.2;
    }
    if (scaleBall > 25 && scaleBall < 35) {
      textFont(titleFont);
      textAlign(CENTER, CENTER);
      text('P', 2.5*width/8, 2.8*height/10);
      scaleBall ++;
    }
    if (scaleBall > 35 && scaleBall < 45) {
      textAlign(CENTER, CENTER);
      text('N', 4.55*width/8, 2.8*height/10);
      scaleBall ++;
    }
    if (scaleBall > 45 && scaleBall < 55) {
      textAlign(CENTER, CENTER);
      text('G', 5.5*width/8, 2.8*height/10);
      scaleBall ++;
    }
    if (scaleBall > 55) {
      gameIntro = true;
      titleScreen = true;
      valueFromController = 0;
      alpha = 255;
    }
  }
}
