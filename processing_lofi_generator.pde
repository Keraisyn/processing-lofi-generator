import processing.sound.*;
PApplet sketchPApplet;
int beatDivision = 4;

Drums d;
Bass b;
Rhodes r;

SinOsc s;

void setup() {
    sketchPApplet = this;

    Chord[] progression = {
        new Chord(new Note(70), "7"), 
        new Chord(new Note(72), "m7"), 
        new Chord(new Note(74), "m7"), 
        new Chord(new Note(74), "m7"), 
    };

    float tempo = 80;
    int frameRate = int(tempo/60*beatDivision);
    frameRate(frameRate);
    d = new Drums(); 
    b = new Bass(progression);  
    r = new Rhodes(progression);
}

void draw() {
    d.step();
    b.step();
    r.step();
}
