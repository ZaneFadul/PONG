//*************************************************************************Game Objects
class Paddle
{
  float speed = 1;
  int direction;
  float xpos;
  float ypos;
  int colorIndex = 1;
  int newColor;

  Paddle(int colorIndex, float speed, float xpos, float ypos)
  {
    this.speed = speed;
    this.xpos = xpos;
    this.ypos = ypos;
    this.colorIndex = colorIndex;
  }

  void setSpeed (float newSpeed) {
    this.speed = newSpeed;
  }

  void setMultiplier(float multiplier) {
    this.speed *= multiplier;
  }

  float getSpeed() {
    return this.speed;
  }

  void setColor(int colorIndex) {
    this.colorIndex = colorIndex;
  }

  int getColor() {
    return this.colorIndex;
  }

  void show(float xpos, float ypos) {
    switch(colorIndex) {
    case 1:
      newColor = 255;
      break;
    case 2:
      newColor = #FF0000;
      break;
    case 3:
      newColor = #0700FF;
      break;
    case 4:
      newColor = #B600FF;
      break;
    case 5:
      newColor = #1BFF08;
      break;
    case 666: //used for abilities
      newColor = 0;
      break;
    }
    fill(newColor);
    noStroke();
    rect(xpos, ypos, height/36, height/8);
    this.ypos = ypos;
  }

  void display(int direction) {
    noStroke();
    switch(colorIndex) {
    case 1:
      newColor = 255;
      break;
    case 2:
      newColor = #FF0000;
      break;
    case 3:
      newColor = #0700FF;
      break;
    case 4:
      newColor = #B600FF;
      break;
    case 5:
      newColor = #1BFF08;
      break;
    case 666: //used for abilities
      newColor = 0;
      break;
    }
    switch(direction) {
    case 2:
      fill(newColor);
      rectMode(CENTER);
      rect(xpos, ypos, height/36, height/8);
      break;

    case 0:
      if (ypos - height/16 > height/20) {
        ypos -= speed*height/250;
      }
      fill(newColor);
      rectMode(CENTER);
      rect(xpos, ypos, height/36, height/8);
      break;

    case 1:
      if (ypos + height/16 < height - height/20) {
        ypos += speed*height/250;
      }
      fill(newColor);
      rectMode(CENTER);
      rect(xpos, ypos, height/36, height/8);
      break;
    }
  }

  float getxPos() {
    return xpos;
  }
  float getyPos() {
    return ypos;
  }
}

class Ball
{
  float speed = 1;
  int direction = int(random(1, 4));
  float xpos = width/2;
  float ypos = height/2;
  int col = 1;

  Ball(float speed)
  {
    this.speed = speed;
  }

  void setSpeed(float newSpeed) {
    this.speed = newSpeed;
  }

  void setMultiplier(float multiplier) {
    this.speed *= multiplier;
  }

  float getSpeed() {
    return this.speed;
  }

  void setColor(int col) {
    this.col = col;
  }

  void show(int col) {
    switch(col) {
    case 1:
      col = 255;
      break;
    case 2:
      col = #0063FF;
      break;
    }

    noStroke();
    fill(col);
    xpos = width/2;
    ypos = height/2;
    rect(width/2, height/2, height/60, height/60);
    direction = int(random(1, 4));
  }

  void hide() {
    noStroke();
    fill(255);
    xpos = width/2;
    ypos = height/2;
    rect(-400, -400, 1, 1);
    direction = int(random(1, 4));
  }

  int display() {
    switch(col) {
    case 1:
      col = 255;
      break;
    case 2:
      col = #0063FF;
      break;
    }
    fill(col);
    switch(direction) {
    case 1: //North East
      noStroke();
      rect(xpos, ypos, height/60, height/60);
      xpos += speed*width/400;
      ypos -= speed*width/400;
      break;

      case(2): //North West
      noStroke();
      rect(xpos, ypos, height/60, height/60);
      xpos -= speed*width/400;
      ypos -= speed*width/400;
      break;

      case(3): //South West
      noStroke();
      rect(xpos, ypos, height/60, height/60);
      xpos -= speed*width/400;
      ypos += speed*width/400;
      break;

      case(4): //South East
      rect(xpos, ypos, height/60, height/60);
      xpos += speed*width/400;
      ypos += speed*width/400;
      break;
    }
    if (ypos <= height/20 + 5 && direction == 2) { //hit top from left
      direction = 3;
      return 0;
    }
    if (ypos <= height/20 + 5 && direction == 1) { //hit top from right
      direction = 4;
      return 0;
    }
    if (xpos <= paddle1.getxPos() && ypos + height/60 >= paddle1.getyPos() + height/8 && direction == 1) { //hit bottom of paddle 1 (i guess lmao)
      direction = 3;
      return 0;
    }
    if (ypos + height/100 >= height - height/20 && direction == 3) { //hit bottom from left
      direction = 2;
      return 0;
    }
    if (ypos + height/100 >= height - height/20 && direction == 4) { //hit bottom from right
      direction = 1;
      return 0;
    }
    if (xpos <= paddle1.getxPos() + height/60 && ypos >= paddle1.getyPos() - height/16 && ypos <= paddle1.getyPos() + height/16 && direction == 2) { //hit left going up
      direction = 1;
      return 1;
    }
    if (xpos <= paddle1.getxPos() + height/60 && ypos >= paddle1.getyPos() - height/16 && ypos <= paddle1.getyPos() + height/16  && direction == 3) { //hit left going down
      direction = 4;
      return 1;
    }
    if (xpos + height/100 >= paddle2.getxPos() - height/120 && ypos >= paddle2.getyPos() - height/16 && ypos <= paddle2.getyPos() + height/16 && direction == 1) { //hit right going up
      direction = 2;
      return 2;
    }
    if (xpos + height/100 >= paddle2.getxPos() - height/120 && ypos >= paddle2.getyPos() - height/16 && ypos <= paddle2.getyPos() + height/16 && direction == 4) { //hit hit right going down
      direction = 3;
      return 2;
    }    
    if (xpos <= 0 && direction == 2) { //hit left going up
      return 3;
    }
    if (xpos <= 0 && direction == 3) { //hit left going down
      return 3;
    }
    if (xpos + height/100 >= width && direction == 1) { //hit right going up
      return 4;
    }
    if (xpos + height/100 >= width && direction == 4) { //hit hit right going down
      return 4;
    } else {
      return 0;
    }
  }
}

Paddle paddle1;
Paddle paddle2;
Ball ball;

int paddle1TempColor;
int paddle2TempColor;
int paddle1Charge;
int paddle2Charge;
int player1Lives;
int player2Lives;
int ballValues;

//**********************************************************************************Ability
void incrementCharge(int paddleCharge) {
  switch (paddleCharge) {
  case 0:
    break;
  case 1:
    if (paddle1Charge != 10) {
      paddle1Charge+= 5;
    }
    break;
  case 2:
    if (paddle2Charge != 10) {
      paddle2Charge+= 5;
    }
    break;
  }
}
int abilityTimer1 = 0;
int abilityTimer2 = 0;
