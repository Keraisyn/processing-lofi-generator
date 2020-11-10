// Sub bass instrument
// Sine wave playing the root note of chords at very low frequencies.

public class Bass {
    // Notes that are played through the pattern.
    private Note[] notes;
    
    // Create Sine Oscillator.
    private SinOsc sine = new SinOsc(sketchPApplet);
    
    // Default sound values
    private float defaultVolume = 0.5;
    private float pan = 0.0;
    
    // Which chord of the progression the instrument is currently on.
    private int patternIndex = 0;
    
    // Tally of passed steps.
    private int divisionCount = 0;


    // Bass requires a chord progression.
    public Bass(Chord[] progression) {
        // Extract roots from the progression.
        this.getNotes(progression);
        
        // Set sound defaults
        this.sine.amp(this.defaultVolume);
        this.sine.pan(this.pan);
    }


    // Extract roots from a chord progression.
    public void getNotes(Chord[] progression) {
        this.notes = new Note[progression.length];
        for (int i = 0; i < progression.length; i++) {
            this.notes[i] = progression[i].root;
        }
    }


    // Called at each step. Plays notes.
    public void step() {
        // If we are at the start of a new chord.
        if (this.divisionCount % (beatDivision * 4) == 0) {
            // "Turn off" the instrument by setting volume to 0.
            this.sine.stop();
            
            // Get frequency of the note and lower it into bass frequency.
            float frequency = this.notes[this.patternIndex].frequency;
            float adjustedFrequency = frequency / (pow(2, 2));
            this.sine.freq(adjustedFrequency);
            
            this.sine.play();

            // Return to beginning of chord progression if at end.
            if (this.patternIndex == this.notes.length-1) {
                this.patternIndex = 0;
            } else {
                this.patternIndex++;
            }
        }

        // Update step() call count.
        this.divisionCount++;
    }
    

    // Functions for adjusting volume and pan
    public void changeVolume(float v) {
        this.sine.amp(v);
    }
    

    public void changePan(float v) {
        this.sine.pan(v);
    }
}
