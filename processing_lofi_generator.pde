import processing.sound.*;
PApplet sketchPApplet;
int beatDivision = 4;
Sound globalSound;

Drums d;
Bass b;
Rhodes r;
Rain ra;

SinOsc s;

void setup() {
    sketchPApplet = this;
    globalSound = new Sound(this);

    Chord[][] progressions = {
        {
            // also forgot
            new Chord(new Note(70), "7"), 
            new Chord(new Note(72), "m7"), 
            new Chord(new Note(74), "m7"), 
            new Chord(new Note(74), "m7")
        }, 
        {
            // forgot
            new Chord(new Note(62), "m9"), 
            new Chord(new Note(67), "9sus4"), 
            new Chord(new Note(57), "9sus4"), 
            new Chord(new Note(61), "d7")
        }, 
        {
            // Ebmaj7, F7sus2, G#maj7, G#maj7, Ebmaj7, F7sus2, C7sus2, C7sus2
            new Chord(new Note(63), "M7"), 
            new Chord(new Note(65), "sus2"), 
            new Chord(new Note(68), "M7"), 
            new Chord(new Note(68), "M7"), 
            new Chord(new Note(63), "M7"), 
            new Chord(new Note(65), "sus2"), 
            new Chord(new Note(60), "sus2"), 
            new Chord(new Note(60), "sus2")
        }
    };

    //Chord[] progression = {
    //    new Chord(new Note(70), "7"), 
    //    new Chord(new Note(72), "m7"), 
    //    new Chord(new Note(74), "m7"), 
    //    new Chord(new Note(74), "m7"), 
    //};

    Chord[] progression = progressions[2];

    float tempo = 80;
    int frameRate = int(tempo/60*beatDivision);
    frameRate(frameRate);
    d = new Drums(); 
    b = new Bass(progression);  
    r = new Rhodes(progression);
    ra = new Rain();
}

void draw() {
    d.step();
    b.step();
    r.step();
    ra.step();
}
