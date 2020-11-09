// Library imports
// Official Processing Sound library. Used for all sound features.
import processing.sound.*;

import g4p_controls.*;

// Intiate PApplet
PApplet sketchPApplet;

// How many parts a single beat is split into. Default value is 4 (16ths).
int beatDivision = 4;

// How many beats are in a bar. Default is 4 (4/4 time).
int barLength = 4;

// Initiate global Sound object.
Sound globalSound;

// Initiate each instrument
Drums d;
Bass b;
Rhodes r;
Rain ra;
Melody m;
Vinyl v;


// Transpose the chord by a random number of steps. -6 > diffSteps > 5
public void transpose(Chord[] prog) {
    // Pick number of semitones to transpose the chord progression by.
    int diffSteps = (int) random(-6, 6);

    // For each note in each chord, change the note.
    for (Chord c : prog) {
        c.root.changeNote(c.root.keycode + diffSteps);
        for (Note n : c.chord) {
            n.changeNote(n.keycode + diffSteps);
        }

        for (int i = 1; i < c.scale.length; i++) {
            Note n = c.scale[i];
            n.changeNote(n.keycode + diffSteps);
        }
    }
}


void setup() {
    createGUI();
    size(1000, 800);
    
    // Create a reference to the Processing applet. This is required for
    // the processing.Sound library.
    sketchPApplet = this;
    // Create a reference to a global Sound object. This is used for 
    // some processing.Sound features.
    globalSound = new Sound(this);

    // List of all used chord progressions. TODO: CHANGE TO TEXT FILE!
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

    // Transpose each chord from the progression bank.
    for (Chord[] p : progressions) {
        transpose(p);
    }

    // Choose a random chord progression from the bank.
    Chord[] progression = progressions[(int) random(0, progressions.length)];
    //Chord[] progression = progressions[0];

    // Set the tempo. How many beats occur every minute.
    float tempo = 80;

    // Set the frameRate. This is how many times the draw() loop occurs every second.
    int frameRate = int(tempo/60*beatDivision);
    frameRate(frameRate);

    // Instantiate each instrument with the chord progression if
    // that instrument needs it.
    d = new Drums(); 
    b = new Bass(progression);  
    r = new Rhodes(progression);
    ra = new Rain();
    m = new Melody(progression);
    v = new Vinyl();
}

// For each loop, step forward on each instrument.
void draw() {
    d.step();
    b.step();
    r.step();
    ra.step();
    m.step();
    v.step();
}
