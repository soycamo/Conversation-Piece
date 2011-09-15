// Tin can A
/* Written by Cameron Adamez under a BSD license. */
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
  //pinMode(ledPin, OUTPUT);
  pinMode(Switch, OUTPUT);
  
}

char last_listener;

void loop() {

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
}

