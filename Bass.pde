// Sub bass instrument
// Sine wave playing the root note of chords at very low frequencies.

public class Bass {
    // Notes that are played through the pattern.
    Note[] notes;
    
    // Instantiate Sine Oscillator.
    SinOsc sine = new SinOsc(sketchPApplet);
    
    // Which chord of the progression the instrument is currently on.
    private int patternIndex = 0;
    
    // Tally of passed steps.
    private int divisionCount = 0;


    // Bass requires a chord progression.
    public Bass(Chord[] progression) {
        // Extract roots from the progression.
        this.getNotes(progression);
        
        // Start sine with volume 0
        this.sine.amp(0);
        this.sine.play();
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
            this.sine.amp(0);
            
            // Get frequency of the note and bring it into bass frequency.
            // TODO: USE THAT FUNCTION TO BRING IT NEAR A CERTAIN NOTE.
            float frequency = this.notes[this.patternIndex].frequency;
            float adjustedFrequency = frequency / (pow(2, 2));
            this.sine.freq(adjustedFrequency);
            
            // "Play" the instrument by setting volume. Default 0.5.
            this.sine.amp(0.5);

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
}
