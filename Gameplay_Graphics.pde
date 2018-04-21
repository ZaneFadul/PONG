//**********************************************************************GAMEPLAY GRAPHICS
// Star Field Graphic used by:
// Daniel Shiffman
// http://codingtra.in
// http://patreon.com/codingtrain
// Code for: https://youtu.be/17WoOqgXsRM
class Star {
  float x;
  float y;
  float z;
  float pz;

  Star() {
    x = random(-width/2, width/2);
    y = random(-height/2, height/2);
    z = random(width/2);
    pz = z;
  }

  void update() {
    z = z - speed;
    if (z < 1) {
      z = width/2;
      x = random(-width/2, width/2);
      y = random(-height/2, height/2);
      pz = z;
    }
  }

  void show() {
    strokeWeight(1);
    fill(255);
    noStroke();
    float sx = map(x / z, 0, 1, 0, width/2);
    float sy = map(y / z, 0, 1, 0, height/2);
    float px = map(x / pz, 0, 1, 0, width/2);
    float py = map(y / pz, 0, 1, 0, height/2);
    pz = z;
    pushMatrix();
    stroke(255);
    translate(width/2, height/2);
    line(px, py, sx, sy);
    popMatrix();
  }
}
int speed = height/30;
Star[] stars = new Star[800];

//Game Variables
class Transition {
  float x = random(0, width);
  float y = random(height);
  float xSpeed = random(width/5, width/2);

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
Transition[] particles = new Transition[100];
int transitionCount = 0;

//Ability Bars
void abilityBar1(int charge, float spark) {
  switch(charge) {
  case 0:
    noStroke();
    rectMode(CORNER);
    fill(170);
    rect(3.3*width/4, height/80, width/8, height/40);
    break;

  case 1:
    noStroke();
    rectMode(CORNER);
    fill(170);
    rect(3.3*width/4, height/80, width/8, height/40);
    fill(#0063FF);
    rect(3.3*width/4, height/80, width/80, height/40);
    break;

  case 2:
    noStroke();
    rectMode(CORNER);
    fill(170);
    rect(3.3*width/4, height/80, width/8, height/40);
    fill(#0063FF);
    rect(3.3*width/4, height/80, 2*width/80, height/40);
    break;

  case 3:
    noStroke();
    rectMode(CORNER);
    fill(170);
    rect(3.3*width/4, height/80, width/8, height/40);
    fill(#0063FF);
    rect(3.3*width/4, height/80, 3*width/80, height/40);
    break;

  case 4:
    noStroke();
    rectMode(CORNER);
    fill(170);
    rect(3.3*width/4, height/80, width/8, height/40);
    fill(#0063FF);
    rect(3.3*width/4, height/80, 4*width/80, height/40);
    break;

  case 5:
    noStroke();
    rectMode(CORNER);
    fill(170);
    rect(3.3*width/4, height/80, width/8, height/40);
    fill(#0063FF);
    rect(3.3*width/4, height/80, 5*width/80, height/40);
    break;

  case 6:
    noStroke();
    rectMode(CORNER);
    fill(170);
    rect(3.3*width/4, height/80, width/8, height/40);
    fill(#0063FF);
    rect(3.3*width/4, height/80, 6*width/80, height/40);
    break;

  case 7:
    noStroke();
    rectMode(CORNER);
    fill(170);
    rect(3.3*width/4, height/80, width/8, height/40);
    fill(#0063FF);
    rect(3.3*width/4, height/80, 7*width/80, height/40);
    break;

  case 8:
    noStroke();
    rectMode(CORNER);
    fill(170);
    rect(3.3*width/4, height/80, width/8, height/40);
    fill(#0063FF);
    rect(3.3*width/4, height/80, 8*width/80, height/40);
    break;

  case 9:
    noStroke();
    rectMode(CORNER);
    fill(170);
    rect(3.3*width/4, height/80, width/8, height/40);
    fill(#0063FF);
    rect(3.3*width/4, height/80, 9*width/80, height/40);
    break;

  case 10:
    noStroke();
    rectMode(CORNER);
    spark = random(170, 255);
    fill(#0063FF, spark);
    rect(3.3*width/4, height/80, width/8, height/40);
    break;
  }
}
void abilityBar2(int charge, float spark) {
  switch(charge) {
  case 0:
    noStroke();
    rectMode(CORNER);
    fill(170);
    rect(3.3*width/4, 77*height/80, width/8, height/40);
    break;

  case 1:
    noStroke();
    rectMode(CORNER);
    fill(170);
    rect(3.3*width/4, 77*height/80, width/8, height/40);
    fill(#0063FF);
    rect(3.3*width/4, 77*height/80, width/80, height/40);
    break;

  case 2:
    noStroke();
    rectMode(CORNER);
    fill(170);
    rect(3.3*width/4, 77*height/80, width/8, height/40);
    fill(#0063FF);
    rect(3.3*width/4, 77*height/80, 2*width/80, height/40);
    break;

  case 3:
    noStroke();
    rectMode(CORNER);
    fill(170);
    rect(3.3*width/4, 77*height/80, width/8, height/40);
    fill(#0063FF);
    rect(3.3*width/4, 77*height/80, 3*width/80, height/40);
    break;

  case 4:
    noStroke();
    rectMode(CORNER);
    fill(170);
    rect(3.3*width/4, 77*height/80, width/8, height/40);
    fill(#0063FF);
    rect(3.3*width/4, 77*height/80, 4*width/80, height/40);
    break;

  case 5:
    noStroke();
    rectMode(CORNER);
    fill(170);
    rect(3.3*width/4, 77*height/80, width/8, height/40);
    fill(#0063FF);
    rect(3.3*width/4, 77*height/80, 5*width/80, height/40);
    break;

  case 6:
    noStroke();
    rectMode(CORNER);
    fill(170);
    rect(3.3*width/4, 77*height/80, width/8, height/40);
    fill(#0063FF);
    rect(3.3*width/4, 77*height/80, 6*width/80, height/40);
    break;

  case 7:
    noStroke();
    rectMode(CORNER);
    fill(170);
    rect(3.3*width/4, 77*height/80, width/8, height/40);
    fill(#0063FF);
    rect(3.3*width/4, 77*height/80, 7*width/80, height/40);
    break;

  case 8:
    noStroke();
    rectMode(CORNER);
    fill(170);
    rect(3.3*width/4, 77*height/80, width/8, height/40);
    fill(#0063FF);
    rect(3.3*width/4, 77*height/80, 8*width/80, height/40);
    break;

  case 9:
    noStroke();
    rectMode(CORNER);
    fill(170);
    rect(3.3*width/4, 77*height/80, width/8, height/40);
    fill(#0063FF);
    rect(3.3*width/4, 77*height/80, 9*width/80, height/40);
    break;

  case 10:
    noStroke();
    rectMode(CORNER);
    spark = random(170, 255);
    fill(#0063FF, spark);
    rect(3.3*width/4, 77*height/80, width/8, height/40);
    break;
  }
}
float spark1 = 255;
float spark2 = 255;

//Lives
void printP1Lives(int lives, int colorIndex) {
  switch(colorIndex) {
  case 1:
    colorIndex = #B2D8FF;
    break;
  case 2:
    colorIndex = #FF0000;
    break;
  case 3:
    colorIndex = #0700FF;
    break;
  case 4:
    colorIndex = #B600FF;
    break;
  case 5:
    colorIndex = #1BFF08;
    break;
  case 666:
    colorIndex = 0;
    break;
  }
  switch(lives) {
  case 3:
    strokeWeight(4);
    stroke(colorIndex);
    shapeMode(CENTER);
    fill(255);
    ellipse(3*width/8, height/40, height/40, height/40);
    ellipse(width/2, height/40, height/40, height/40);
    ellipse(5*width/8, height/40, height/40, height/40);
    break;

  case 2:
    strokeWeight(4);
    stroke(colorIndex);
    shapeMode(CENTER);
    fill(255);
    ellipse(3*width/8, height/40, height/40, height/40);
    ellipse(width/2, height/40, height/40, height/40);
    fill(0);
    ellipse(5*width/8, height/40, height/40, height/40);
    break;

  case 1:
    strokeWeight(4);
    stroke(colorIndex);
    shapeMode(CENTER);
    fill(255);
    ellipse(3*width/8, height/40, height/40, height/40);
    fill(0);
    ellipse(width/2, height/40, height/40, height/40);
    ellipse(5*width/8, height/40, height/40, height/40);
    break;

  case 0:
    strokeWeight(4);
    stroke(colorIndex);
    shapeMode(CENTER);
    fill(0);
    ellipse(3*width/8, height/40, height/40, height/40);
    ellipse(width/2, height/40, height/40, height/40);
    ellipse(5*width/8, height/40, height/40, height/40);
    break;
  }
}

void printP2Lives(int lives, int colorIndex) {
  switch(colorIndex) {
  case 1:
    colorIndex = #B2D8FF;
    break;
  case 2:
    colorIndex = #FF0000;
    break;
  case 3:
    colorIndex = #0700FF;
    break;
  case 4:
    colorIndex = #B600FF;
    break;
  case 5:
    colorIndex = #1BFF08;
    break;
  case 666:
    colorIndex = 0;
    break;
  }
  switch(lives) {
  case 3:
    strokeWeight(4);
    stroke(colorIndex);
    shapeMode(CENTER);
    fill(255);
    ellipse(3*width/8, 39*height/40, height/40, height/40);
    ellipse(width/2, 39*height/40, height/40, height/40);
    ellipse(5*width/8, 39*height/40, height/40, height/40);
    break;

  case 2:
    strokeWeight(4);
    stroke(colorIndex);
    shapeMode(CENTER);
    fill(255);
    ellipse(3*width/8, 39*height/40, height/40, height/40);
    ellipse(width/2, 39*height/40, height/40, height/40);
    fill(0);
    ellipse(5*width/8, 39*height/40, height/40, height/40);
    break;

  case 1:
    strokeWeight(4);
    stroke(colorIndex);
    shapeMode(CENTER);
    fill(255);
    ellipse(3*width/8, 39*height/40, height/40, height/40);
    fill(0);
    ellipse(width/2, 39*height/40, height/40, height/40);
    ellipse(5*width/8, 39*height/40, height/40, height/40);
    break;

  case 0:
    strokeWeight(4);
    stroke(colorIndex);
    shapeMode(CENTER);
    fill(0);
    ellipse(3*width/8, 39*height/40, height/40, height/40);
    ellipse(width/2, 39*height/40, height/40, height/40);
    ellipse(5*width/8, 39*height/40, height/40, height/40);
    break;
  }
}

//End Game Variables
int endGameTimer = 0;