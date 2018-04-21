void changeUserColorScreen() {
  if (changeUserColor == true) {
    //Create User Button Objects
    for (int i = 0; i < userList.length; i++) {
      if (userList[i].getUsername() != null) {
        userButtons[i] = new Button(i+6, userList[i].getUsername(), width/4, i*height/8);
      } else {
        userButtons[i] = new Button(i+6, "No User", width/4, i*height/8);
      }
    }
    //Display User Button Objects
    for (int i = 0; i < userButtons.length; i++)
    {
      userButtons[i].display();
    }


    //List Users and allow player to select User
    if (listUsers == true && selectUserToColor == true) {
    }

    if (chooseColor == true && firstTimeAdd != true) {
      //Copy User attributes (username and rank)
      //Delete User, bring to a clone of Color Screen in Add users
      //SAVE USERS
      //Return to Main Menu
    }
  }
}
