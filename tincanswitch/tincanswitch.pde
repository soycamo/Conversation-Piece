/* Written by Cameron Adamez under a BSD license. */

// Tin can A
#define aTalk 2
#define aHear 3
// Tin can B
#define bTalk 4
#define bHear 5

#define ledPin 13 // onboard LED
#define Switch 7

void setup() {
  pinMode(aTalk, INPUT);
  pinMode(aHear, INPUT);
  pinMode(bTalk, INPUT);
  pinMode(bHear, INPUT);
  pinMode(ledPin, OUTPUT);
  pinMode(Switch, OUTPUT);
  
}

char[100] listener_log;

void loop() {

  int a_state = determineCanState(aTalk, aHear);
  int b_state = determineCanState(bTalk, bHear);

  if (a_state == b_state) {
    // give priority to last listener.
  }
  else {

    0 + 1 // can s
    0 + 2 //
    1 + 2 // this state needs to distinguish

    // To turn A on, switch is pulled HIGH.
    // To turn B on, switch is pulled LOW.
    // By turning it on, it will talk.
    if ((a_state == 1) || (a_state == 0 && b_state == 2)) { 
      digitalWrite(ledPin, HIGH);
      digitalWrite(Switch, HIGH);
    }
    else if ((b_state == 1) || (b_state == 0 && a_state == 2)) {
      digitalWrite(ledPin, LOW);
      digitalWrite(Switch, LOW);
    }

  }

/*
  if((digitalRead(aHear) && digitalRead(bTalk)) || (digitalRead(aHear) && (!digitalRead(bTalk) && !digitalRead(bHear))) || (digitalRead(aHear) && (!digitalRead(bTalk) && !digitalRead(bHear)))) {
    last_listener = 'a';
    digitalWrite(Switch, LOW);
  }
  else if(digitalRead(aTalk) && digitalRead(bHear)){
    last_listener = 'b';
    digitalWrite(Switch, HIGH);
  }
  else if((digitalRead(aHear) && digitalRead(bHear)) || (digitalRead(aTalk) && digitalRead(bTalk))){
    (last_listener == 'a') ? digitalWrite(Switch, LOW) : digitalWrite(Switch, HIGH);
  }
  else{
    // Uhh.  
    digitalWrite(Switch, HIGH);
  }
  */
}

/*
  returns:
    0: indeterminate
    1: speaking
    2: listening
*/
int determineCanState(talkPin, hearPin) {
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
