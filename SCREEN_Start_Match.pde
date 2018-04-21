void startMatchScreen() {
  if (startMatch == true) {

    controllerCheck(4,6);

    if (b == 1) {
      startMatch = false;
      titleScreen = true;
      selectUser1Button.changeText("SELECT PLAYER 1");
      selectUser2Button.changeText("SELECT PLAYER 2");
      valueFromController = 0;
    }

    background(0);
    for (int i = 0; i < drops.length; i++) {
      drops[i].fall();
      drops[i].show();
    }
    //Select Users
    selectUser1Button.display();
    selectUser2Button.display();
    playGameButton.display();

    if (a == 1 && valueFromController == selectUser1Button.getButtonIndex()) {
      listUsers = true;
      startMatch = false;
      selectUserToAdd = true;
      player1Selected = true;
      player2Selected = false;
      a = 0;
      valueFromController = 7;
    }
    if (a == 1 && valueFromController == selectUser2Button.getButtonIndex()) {
      listUsers = true;
      startMatch = false;
      selectUserToAdd = true;
      player2Selected = true;
      player1Selected = false;
      a = 0;
      valueFromController = 7;
    }
    if (selectUser1Button.getButtonName() == "SELECT PLAYER 1" || selectUser2Button.getButtonName() == "SELECT PLAYER 2" ) {
      noStroke();
      fill(255, 70);
      rect(width/2, 6*height/8, width/5, height/12);
    }
    //(1st time) Return to Start Match Options showing one slot still open for another user
    //(2nd time) Return to Start Match Options unlocking Play button
    //Play Button (if two users are selected)
    if (selectUser1Button.getButtonName() != "SELECT PLAYER 1" && selectUser2Button.getButtonName() != "SELECT PLAYER 2" ) {
      //Starts Game
      if (a == 1 && valueFromController == playGameButton.getButtonIndex()) {
        transition = true;
        startMatch = false;
        a = 0;
        menu.stop();
        transitionCount = 0;
        alpha = 0;
      }
    }
  }

  //**********************************************List Users and allow player to select with the A button (SCREEN #5)
  if (listUsers == true && selectUserToAdd == true) {
    background(0);

    if (b == 1) {
      startMatch = true;
      listUsers = false;
      selectUserToAdd = false;
      player1Selected = false;
      player2Selected = false;
      valueFromController = 4;
      b = 0;
    }
    controllerCheck(7,12);
     
    for (int i = 0; i < drops.length; i++) {
      drops[i].fall();
      drops[i].show();
    }
    //Create User Button Objects
    for (int i = 0; i < userList.length; i++) {
      try {
        userButtons[i] = new Button(i+7, userList[i].getUsername(), width/4, (i+1)*height/7);
      } 
      catch(Exception e) {
        userButtons[i] = new Button(i+7, "NO USER", width/4, (i+1)*height/7);
      }
    }
    //Display User Button Objects
    for (int i = 0; i < userButtons.length; i++)
    {
      userButtons[i].display();
      try {
        text("WINS: " + userList[i].getRank(), 3*width/4, (i+1)*height/7 + height/49, width/5, height/12);
      }
      catch (Exception e) {
      }
    }
    if (userList[0] != null) {
      if (a == 1 && valueFromController == userButtons[0].getButtonIndex()) {
        a = 0;
        if (player1Selected == true) {
          paddle1.setColor(userList[0].getPreferredColor());
          selectUser1Button.changeText(userList[0].getUsername());
          listUsers = false;
          selectUserToAdd = false;
          startMatch = true;
          valueFromController = 4;
        }
        if (player2Selected == true) {
          paddle2.setColor(userList[0].getPreferredColor());
          selectUser2Button.changeText(userList[0].getUsername());
          listUsers = false;
          selectUserToAdd = false;
          startMatch = true;
          valueFromController = 5;
        }
      }
    }
    if (userList[1] != null) {
      if (a == 1 && valueFromController == userButtons[1].getButtonIndex()) {
        a = 0;
        if (player1Selected == true) {
          paddle1.setColor(userList[1].getPreferredColor());
          selectUser1Button.changeText(userList[1].getUsername());
          listUsers = false;
          selectUserToAdd = false;
          startMatch = true;
          valueFromController = 4;
        }
        if (player2Selected == true) {
          paddle2.setColor(userList[1].getPreferredColor());
          selectUser2Button.changeText(userList[1].getUsername());
          listUsers = false;
          selectUserToAdd = false;
          startMatch = true;
          valueFromController = 5;
        }
      }
    }
    if (userList[2] != null) {
      if (a == 1 && valueFromController == userButtons[2].getButtonIndex()) {
        a = 0;
        if (player1Selected == true) {
          paddle1.setColor(userList[2].getPreferredColor());
          selectUser1Button.changeText(userList[2].getUsername());
          listUsers = false;
          selectUserToAdd = false;
          player1Selected = false;
          startMatch = true;
          valueFromController = 4;
        }
        if (player2Selected == true) {
          paddle2.setColor(userList[2].getPreferredColor());
          selectUser2Button.changeText(userList[2].getUsername());
          listUsers = false;
          selectUserToAdd = false;
          player2Selected = false;
          startMatch = true;
          valueFromController = 5;
        }
      }
    }
    if (userList[3] != null) {
      if (a == 1 && valueFromController == userButtons[3].getButtonIndex()) {
        a = 0;
        if (player1Selected == true) {
          paddle1.setColor(userList[3].getPreferredColor());
          selectUser1Button.changeText(userList[3].getUsername());
          listUsers = false;
          selectUserToAdd = false;
          player1Selected = false;
          startMatch = true;
          valueFromController = 4;
        }
        if (player2Selected == true) {
          paddle2.setColor(userList[3].getPreferredColor());
          selectUser2Button.changeText(userList[3].getUsername());
          listUsers = false;
          selectUserToAdd = false;
          player2Selected = false;
          startMatch = true;
          valueFromController = 5;
        }
      }
    }
    if (userList[4] != null) {
      if (a == 1 && valueFromController == userButtons[4].getButtonIndex()) {
        a = 0;
        if (player1Selected == true) {
          paddle1.setColor(userList[4].getPreferredColor());
          selectUser1Button.changeText(userList[4].getUsername());
          listUsers = false;
          selectUserToAdd = false;
          player1Selected = false;
          startMatch = true;
          valueFromController = 4;
        }
        if (player2Selected == true) {
          paddle2.setColor(userList[4].getPreferredColor());
          selectUser2Button.changeText(userList[4].getUsername());
          listUsers = false;
          selectUserToAdd = false;
          player2Selected = false;
          startMatch = true;
          valueFromController = 5;
        }
      }
    }
    if (userList[5] != null) {
      if (a == 1 && valueFromController == userButtons[5].getButtonIndex()) {
        a = 0;
        if (player1Selected == true) {
          paddle1.setColor(userList[5].getPreferredColor());
          selectUser1Button.changeText(userList[5].getUsername());
          listUsers = false;
          selectUserToAdd = false;
          player1Selected = false;
          startMatch = true;
          valueFromController = 4;
        }
        if (player2Selected == true) {
          paddle2.setColor(userList[5].getPreferredColor());
          selectUser2Button.changeText(userList[5].getUsername());
          listUsers = false;
          selectUserToAdd = false;
          player2Selected = false;
          startMatch = true;
          valueFromController = 5;
        }
      }
    }
  }
}
