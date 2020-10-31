import processing.sound.*;
PApplet sketchPApplet;
int beatDivision = 4;

Drums d;
Bass b;

SinOsc s;

void setup() {
    sketchPApplet = this;
    Note A = new Note(60);
    println(A.keyname);
    println(A.frequency);

    Chord[] progression = {
        new Chord(new Note(70), "7"), 
        new Chord(new Note(72), "m7"), 
        new Chord(new Note(74), "m7"), 
        new Chord(new Note(74), "m7"), 
    };

    //Chord[] progression = {
    //    new Chord(new Note(36), "7"), 
    //};

    float tempo = 100;
    int frameRate = int(tempo/60*beatDivision);
    frameRate(frameRate);
    d = new Drums();
    b = new Bass(progression);
}

void draw() {
    d.step();
    b.step();
}
