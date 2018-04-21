//***********************************************************************Sound Variables
SoundFile intro;
SoundFile menu;
SoundFile buttonClick;
SoundFile battle;
SoundFile transitionSound;
SoundFile ballOut;
SoundFile win;
SoundFile abilityUsed;
SoundFile ability;

float musicStart;
float musicEnd;

void playMusic(SoundFile music) {
  if (music.isPlaying() != 1) {
    musicStart = millis();
    musicEnd = millis() + (music.duration()*1000);
    music.play();
  }
  if (millis() >= musicEnd) {
    music.stop();
  }
}
