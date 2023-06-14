# processing-lofi-generator
Procedurally generate new lo-fi beats with an interactive mixer. Written in Processing (Java).

## About

https://github.com/Keraisyn/processing-lofi-generator/assets/35472865/84811848-60b0-4ea5-934d-7814f03534fa

Whether it's for relaxing or studying, we all need lofi beats for one reason or another. This application continuously generates new lofi music along with an interactive mixer to customize the music to your tastes. Features include:

* 6 built-in sounds and channels
* volume and pan for each instrument
* tempo and master volume adjustment
* choose new progression/drum patterns

Enjoy!

## How Does It Work?
The sounds themselves are mostly sampled with the bass being a simple sine wave. The melody and chords share the same sample but in different registers.

The chord progression and drum pattern are chosen from a bank when the app starts or "New Progression" is pressed. The key is random. Melodies are then created mostly on jazz theory. Consonant tones and smaller intervals appear more often during generation.

## Getting Started
The easiest way to try the lo-fi generator is to download the .exe from the [latest release](https://github.com/Keraisyn/processing-lofi-generator/releases/latest).
Just launch the executable and mix to your heart's desire.

If you'd like to play with the code, you'll need Processing which you can find [here](https://processing.org/download).
Then, download or clone the repository and open `processing-lofi-generator.pde`. Hit the play button to start the app.

Note: the root folder must be named `processing-lofi-generator` for the app to run with the editor.

## Usage
### Instruments
![image](https://github.com/Keraisyn/processing-lofi-generator/assets/35472865/54825ac0-1e30-4923-9521-b9e22bd14aab)
* The light blue vertical slider (fader) is for volume. The very bottom is muted, the very top is 100%.
* The mute checkbox will mute that instrument regardless of fader position.
* Rotating the blue knob (pan) adjusts how much the sound comes from the left side and right side. At the extremes, the sound comes only from one side.
### Master Controls
![image](https://github.com/Keraisyn/processing-lofi-generator/assets/35472865/704ae563-ec32-4d68-8412-ec8a98abb0f7)
* The tempo knob adjusts how fast the song is played. The default is 80bpm, the min is 20bpm, and the max is 160bpm.
* The master knob adjusts the master volume.
* The start button starts playing from the last stopped beat.
* The stop button stop playing and saves the position.
* The new progression button chooses and new key, chord progression, and drum pattern.
