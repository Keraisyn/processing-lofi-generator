// ****************************************************
// TITLE: PROCESSING LOFI GENERATOR AND MIXER
// PURPOSE: FINAL CODING PROJECT
// LAST EDITED: 11/09/2020
// AUTHOR: MATTHEWS MA
// COURSE: ICS 4UI
// TEACHER: MR. SCHATTMAN
// ****************************************************


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

float tempo = 80;

boolean running = true;

Chord[] progression;

Player player;

// Initiate global Sound object.
Sound globalSound;

// Initiate each instrument
Drums d;
Bass b;
Rhodes r;
Rain ra;
Melody m;
Vinyl v;


void setup() {
    createGUI();
    size(500,500);

    // Create a reference to the Processing applet. This is required for
    // the processing.Sound library.
    sketchPApplet = this;
    
    // Create a reference to a global Sound object. This is used for 
    // some processing.Sound features.
    globalSound = new Sound(this);
    
    player = new Player();
}

// For each loop, step forward on each instrument.
void draw() {
    if (running) {
        d.step();
        b.step();
        r.step();
        ra.step();
        m.step();
        v.step();
    }
}
