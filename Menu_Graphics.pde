//************************************************************************Button Objects
class Button
{
  int buttonIndex;
  String text;
  float xPos;
  float yPos;


  Button(int buttonIndex, String text, float xPos, float yPos)
  {
    this.buttonIndex = buttonIndex;
    this.text = text;
    this.xPos = xPos;
    this.yPos = yPos;
  } 

  int getButtonIndex() {
    return buttonIndex;
  }

  String getButtonName() {
    return text;
  }

  void changeText(String text) {
    this.text = text;
  }

  void display() {
    boolean bool = checkForSelected(valueFromController, buttonIndex);
    if (bool == true) { //IF SELECTED
      rectMode(CENTER);
      strokeWeight(width/100);
      stroke(255);
      fill(0);
      rect(xPos, yPos, width/5, height/12);
      fill(255);
      textAlign(CENTER);
      textFont(infoFont);
      text(text, xPos, yPos  + height/48, width/5, height/12); //ATTEMPTS TO PRINT TEXT ON A BOX
    }
    if (bool == false) { //IF NOT SELECTED
      rectMode(CENTER);
      strokeWeight(width/200);
      stroke(255);
      fill(0);
      rect(xPos, yPos, width/5, height/12);
      fill(255);
      textAlign(CENTER);
      textFont(infoFont);
      text(text, xPos, yPos + height/48, width/5, height/12);
    }
  }
}

boolean checkForSelected(int valueFromController, int buttonIndex) {
  if (valueFromController == buttonIndex) {
    return true;
  } else {
    return false;
  }
}

//*********************************************************************Graphic Variables
PFont infoFont;
PFont titleFont;
int heightPixels;
int widthPixels;
int startTime;

//Intro Sequence Variables
float dotX(float dotT) {
  return sin(dotT/10) * heightPixels/5;
}
float dotY(float dotT) {
  return cos(dotT/10) * heightPixels/5;
}
float dotT = 0;
float alpha = 0;
boolean beginTitle = false;
float scaleBall = 2;

//Title Screen Variables
class Drop {
  float x = random(0, width);
  float y = random(height);
  float xSpeed = random(4, 10);

  void fall() {
    x = x + xSpeed;

    if (x > width) {
      y = random(height);
      x = random(-500, -100);
    }
  }

  void show() {
    stroke(160);
    strokeWeight(1);
    line(x, y, x + height/10, y);
  }
}
Drop[] drops = new Drop[100];
