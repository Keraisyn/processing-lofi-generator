// ****************************************************
// TITLE: PROCESSING LOFI GENERATOR AND MIXER
// PURPOSE: FINAL CODING PROJECT
// LAST EDITED: 11/10/2020
// AUTHOR: MATTHEWS MA
// COURSE: ICS 4UI
// TEACHER: MR. SCHATTMAN
// ****************************************************


// Library imports
import processing.sound.*;  // Official Processing Sound library. Used for all sound features.
import g4p_controls.*;      // g4p library for GUI.
import java.util.Map;       // Java HashMap data structure.

PApplet sketchPApplet;      // Initiate PApplet

// Global variables
int beatDivision = 4;   // How many parts a single beat is split into
int barLength = 4;      // How many beats are in a bar

boolean running = true; // Controls whether the programs should step through

float tempo = 80;       // Default tempo that matches the GUI

Sound globalSound;      // Initiate global Sound object.

// Declare player object. It handles progressions, instruments, etc. Having a separate class makes
// choosing another chord progression simple.
Player player;

// Declare each instrument
Drums d;    // Drums
Bass b;     // Bass
Rhodes r;   // Chord instrument
Rain ra;    // Rain sound effect
Melody m;   // Melody instrument based on Rhodes sound
Vinyl v;    // Vinyl sound effect


void setup() {
    createGUI();
    size(500,500);  // 500x500 is the right size for the g4p GUI

    // Create a reference to the Processing applet. This is required for
    // the processing.Sound library.
    sketchPApplet = this;
    
    // Create a reference to a global Sound object. This is used for 
    // some processing.Sound features.
    globalSound = new Sound(this);
    
    player = new Player();
}

// For each loop, step forward on each instrument if program is running.
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
