#include <math.h>
#include <Wire.h>
#include "WiiChuck.h"

#define RED 5
#define YELLOW 6
#define TALK 2
#define HEAR 3
#define PWR 13

WiiChuck chuck = WiiChuck();

void setup() {
  pinMode(RED, OUTPUT);
  pinMode(YELLOW, OUTPUT);
  pinMode(PWR, OUTPUT);
  pinMode(TALK, OUTPUT);
  pinMode(HEAR, OUTPUT);

  chuck.begin();
  chuck.update();
  chuck.calibrateJoy();
  digitalWrite(TALK, LOW);
  digitalWrite(HEAR, LOW);
}


void loop() {
  digitalWrite(PWR, LOW);
  delay(60);
  chuck.update(); 

  if((chuck.readRoll() > 50) || (chuck.readRoll()< -50)) {  
    digitalWrite(YELLOW, HIGH);
    digitalWrite(HEAR, HIGH);
  }
  else{
    digitalWrite(YELLOW, LOW);
    digitalWrite(HEAR, LOW);
  }

  if((chuck.readPitch() > 130) || (chuck.readPitch() < 10)) {  
    digitalWrite(RED, HIGH);
    digitalWrite(TALK, HIGH);
  }
  else{
    digitalWrite(RED, LOW);  
    digitalWrite(TALK, LOW);
  }

}

