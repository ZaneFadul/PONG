//******************************************************************Controller Variables
int valueFromController; //putting a random assignment
int player1Values = 0;
int player2Values = 0;
int down = 0;
int up = 0;
int b = 0;
int a = 0;
int player1Ability = 0;
int player2Ability = 0;

void checkController() {
}

void keyPressed() {
  if (key == CODED) {
    switch(keyCode) {
    case UP:
      player1Values = 0;
      if (up == 0) {
        up = 1;
      } else {
        up = 0;
      }
      break;

    case DOWN:
      player1Values = 1;
      if (down == 0) {
        down = 1;
      } else {
        down = 0;
      }
      break;
    }
  }
  switch(key) {
  case 'z':
    a = 1;
    break;

  case 'x':
    b = 1;
    break;

  case 'q':
    player1Ability = 1;
    break;

  case 'r':
    player2Ability = 1;
    break;

  case 'w':
    player2Values = 0;
    break;

  case 's':
    player2Values = 1;
    break;
  }
  println(up, down, a, b);
}

void keyReleased() {
  if (key == CODED) {
    switch(keyCode) {
    case UP:
      player1Values = 2;
      up = 0;
      break;

    case DOWN:
      player1Values = 2;
      down = 0;
      break;
    }
  }
  switch(key) {
  case 'z':
    a = 0;
    break;

  case 'x':
    b = 0;
    break;

  case 'q':
    player1Ability = 0;
    break;

  case 'r':
    player2Ability = 0;
    break;

  case 'w':
    player2Values = 2;
    break;

  case 's':
    player2Values = 2;
    break;
  }
  println(up, down, a, b);
}

void controllerCheck(int r1, int r2) {
  //Test for arduino
  if (down == 1 && valueFromController != r2) {
    valueFromController ++;
    down = 0;
    buttonClick.play();
  }
  if (up == 1 && valueFromController != r1) {
    valueFromController --;
    up = 0;
    buttonClick.play();
  }
}
