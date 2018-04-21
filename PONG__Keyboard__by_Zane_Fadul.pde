/*
 *
 * THE ULTIMATE PONG ARCADE GAME
 * by Zane Fadul
 *
 */

/* NEW OBJECTIVES FOR KEYBOARD VERSION
 - Fix character select screen
 - GUI fixes
 - Put "Add User" Feature in select player menu
 - Have "player #" next to player name in start match menu
 - "Change Existing User Color" feature
 - Tutorial Mode upon first start
 - Ability Bar change color with paddle
 - Fix Ball physics
 - Add Online Connectivity (possibly idk)
 - Add a ranking System heh
 
/*CURRENT ISSUES
 - Have ability counters reset at the end of battles
 - Fix sound, songs, whatever
 - Create separate function for holding all the abilities, to further standardize adding abilities and making changes easier
 - Reset ability when a life is lost
 - (Opt.) add timer, make ball go faster as time passes, maybe for each life, not sure yet
 - Have base speeds for things like paddle and ball, and have abilities add a multiplier, rather than a literal.
 
 */

import processing.sound.*;
import processing.net.*;

//Main Menu Buttons
Button startMatchButton;
Button addUserButton;
Button changeUserColorButton;
Button howToPlayButton;
Button selectUser1Button;
Button selectUser2Button;
Button playGameButton;
boolean player1Selected = false;
boolean player2Selected = false;

//************************************************************************Data Variables
PrintWriter userDatabase;
String[] userData;

//**********************************************************************Switch Variables
//Screen Switches
boolean gameLoaded = false;
boolean gameIntro = false;
boolean introSkip = false;
boolean titleScreen = false;
boolean listUsers = false;
boolean selectUserToAdd = false;
boolean createUser = false;
boolean chooseColor = false;
boolean firstTimeAdd = false;
boolean selectUserToColor = false;
boolean selectUserToDelete = false;
boolean playGame = false;
boolean transition = false;
boolean gameOver = false;

//Title Screen Button Switches
boolean startMatch = false;
boolean changeUserColor = false;
boolean deleteUser = false;
boolean howToPlay = false;

//Ability Switches
boolean ability1Used = false;
boolean ability2Used = false;

char[] alphabet = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 
  'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};

String[] newUserFromString(String data) {
  String[] splitData = data.split(",");
  return splitData;
}

//User Object Variables
String[] tempUser;
User[] userList = new User[6];
Button[] userButtons = new Button[6];
String[] userListStrings = {"", "", "", "", "", ""};

//**********************************************************************************Setup
void setup() {
  //****WINDOW DIMENSIONS
  fullScreen();
  background(0);
  heightPixels = height;
  widthPixels = width;
  //****TEXT OBJECT DECLARATIONS
  infoFont = createFont("OCR A Extended", width/50, true);
  titleFont = createFont("Corbel Bold", width/6.5, true);
  //****CONTROLLER VALUES
  //****BUTTON OBJECTS
  startMatchButton = new Button(0, "START MATCH", width/2, 4*height/8);
  addUserButton = new Button(1, "ADD USER", width/2, 5*height/8);
  changeUserColorButton = new Button(2, "CHANGE COLOR", width/2, 6*height/8);
  howToPlayButton = new Button(3, "HOW TO PLAY", width/2, 7*height/8);
  selectUser1Button = new Button(4, "SELECT PLAYER 1", width/2, 3*height/8);
  selectUser2Button = new Button(5, "SELECT PLAYER 2", width/2, 4*height/8);
  playGameButton = new Button(6, "PLAY GAME", width/2, 6*height/8);
  //****GAME OBJECTS
  ball = new Ball(1);
  paddle1 = new Paddle(1, 2, width/36, height/2);
  paddle2 = new Paddle(1, 2, 35*width/36, height/2);
  for (int i = 0; i < particles.length; i++) {
    particles[i] = new Transition();
  }
  //****SOUND OBJECTS
  intro = new SoundFile(this, "intro.mp3");
  menu = new SoundFile(this, "menu.mp3");
  buttonClick = new SoundFile(this, "button.mp3");
  battle = new SoundFile(this, "battle.mp3");
  transitionSound = new SoundFile(this, "transition.mp3");
  win = new SoundFile(this, "win.mp3");
  ballOut = new SoundFile(this, "ballout.mp3");
  abilityUsed = new SoundFile(this, "abilityUsed.mp3");
  ability = new SoundFile(this, "ability.mp3");
  //****MENU BACKGROUND
  for (int i = 0; i < drops.length; i++) {
    drops[i] = new Drop();
  }
  //****GAME BACKGROUND
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
  startTime = millis();
}

//***********************************************************************************Draw
void draw() {
  //Load Users from Text File, if none, create one
  introScreen();
  //Title Screen (will have Start Match, Change User Color, Delete User, How To Play)
  mainMenuScreen();
  //************************************************************Start Match Options (SCREEN #4)
  startMatchScreen();
  //*********************************************************************************Add User
  createUserScreen();
  //***********************************************************************Change User Color
  changeUserColorScreen();
  //********************************************************************************Delete User
  deleteUserScreen();
  //********************************************************************************How To Play
  howToPlayScreen();
  //**************************************************************************************PLAY
  transitionToMatchScreen();
  //*******************************************************************************GAME START
  playGameScreen();
}
