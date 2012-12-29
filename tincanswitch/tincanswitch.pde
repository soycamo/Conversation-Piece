/* Written by Cameron Adamez under a BSD license. */

// Tin can A
#define aTalk 2
#define aHear 3

// Tin can B
#define bTalk 4
#define bHear 5

#define ledPin 13 // onboard LED
#define Switch 7

char listener_log; // keeps track of last listener if state is indeterminate

void setup() {
  pinMode(aTalk, INPUT);
  pinMode(aHear, INPUT);
  pinMode(bTalk, INPUT);
  pinMode(bHear, INPUT);
  pinMode(ledPin, OUTPUT);
  pinMode(Switch, OUTPUT);
}

void loop() {
  int a_state = determineCanState(aTalk, aHear);
  int b_state = determineCanState(bTalk, bHear);

  if (a_state == b_state) {
    if (listener_log == 'a') { 
      setSpeakingCan('b');
    }
    else setSpeakingCan('a');
 
  }
  else {
    // To turn A on, switch is pulled HIGH.
    // To turn B on, switch is pulled LOW.
    // By turning it on, it will talk.
    // I think, at least. I should probably reverse this logic?

    // A is talking, or B is listening and A is drooling a little 
    if ((a_state == 1) || (a_state == 0 && b_state == 2)) { 
      setSpeakingCan('a');

    }
    // B is talking, or A is listening and B is staring at nothing 
    else if ((b_state == 1) || (b_state == 0 && a_state == 2)) {
      setSpeakingCan('b');
    }
  }
}

/*
  returns:
    0: indeterminate
    1: speaking
    2: listening
*/
int determineCanState(int talkPin, int hearPin) {
  bool talkState = digitalRead(talkPin);
  bool hearState = digitalRead(hearPin);
  // if talkState is true and hearState is true, return 0.
  // if talkState is false and hearState is false, return 0.
  // if talkState is true and hearState is false, return 1
  // if talkState is false and hearState is true, return 2.

  if (talkState == hearState) {
    return 0;
  }
  else {
    if (talkState) return 1;
    else return 2;
  }
}

void setSpeakingCan(char can) {
  if (can == 'a') {
    listener_log = 'b'; 
    digitalWrite(ledPin, HIGH);
    digitalWrite(Switch, HIGH);
  }
  else if (can == 'b') {
    listener_log = 'a'; 
    digitalWrite(ledPin, LOW);
    digitalWrite(Switch, LOW);
  }
  return;
}
