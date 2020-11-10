// Rhodes instrument
// Plays a chord progression.

public class Rhodes {
    // Target pitch for voicing chords
    private int voiceTarget = 58;

    public float volume = 0.5;

    public float pan = 0.0;

    // Load individual samples from C3 - B3 (48 - 59)
    private SoundFile[] scale = {
        new SoundFile(sketchPApplet, "samples/rhodes/c3.aiff"), new SoundFile(sketchPApplet, "samples/rhodes/c#3.aiff"), new SoundFile(sketchPApplet, "samples/rhodes/d3.aiff"), 
        new SoundFile(sketchPApplet, "samples/rhodes/d#3.aiff"), new SoundFile(sketchPApplet, "samples/rhodes/e3.aiff"), new SoundFile(sketchPApplet, "samples/rhodes/f3.aiff"), 
        new SoundFile(sketchPApplet, "samples/rhodes/f#3.aiff"), new SoundFile(sketchPApplet, "samples/rhodes/g3.aiff"), new SoundFile(sketchPApplet, "samples/rhodes/g#3.aiff"), 
        new SoundFile(sketchPApplet, "samples/rhodes/a3.aiff"), new SoundFile(sketchPApplet, "samples/rhodes/a#3.aiff"), new SoundFile(sketchPApplet, "samples/rhodes/b3.aiff")
    };

    // How many steps have passed
    private int divisionCount = 0;

    // Which chord of the progression the instrument is on
    private int patternIndex = 0;

    // EQ filters
    private ArrayList<LowPass> lpFilters = new ArrayList<LowPass>();
    private ArrayList<HighPass> hpFilters = new ArrayList<HighPass>();

    // Progression that will be used
    private Chord[] progression;


    public Rhodes(Chord[] progression) {
        this.progression = progression;
        this.applyEffects();

        // Voice chord as soon as it comes in
        this.applyVoicing();
    }


    private void applyVoicing() {
        // For each chord, voice it
        for (Chord c : this.progression) {
            c.voice(this.voiceTarget);
        }
    }


    // Apply EQ to sound. This may not work on SoundFiles.
    private void applyEffects() {
        // Apply filters to each note of the scale
        for (SoundFile s : this.scale) {
            LowPass l = new LowPass(sketchPApplet);
            HighPass h = new HighPass(sketchPApplet);
            // Low pass at 7k Hz
            l.freq(100);
            l.process(s);
            // High pass at 50 Hz
            h.freq(50);
            h.process(s);

            // Add to list to keep
            this.lpFilters.add(l);
            this.hpFilters.add(h);
        }
    }


    public void step() {
        // Run if instrument is at a new bar.
        if (this.divisionCount % (beatDivision * 4) == 0) {
            // Go through each note of the current chord
            for (Note note : this.progression[patternIndex].chord) {
                int code = note.keycode;

                // Which index of the scale array is to be used
                int scaleIndex = code % 12;    

                // Calculate the rate at which the soundfile will be played.
                // The formula to find this is 2^(octave change). For example,
                // an octave up will have rate 2^1 = 2. An octave down will have
                // rate 2 ^ -1 = 0.5.
                int rateDiff = (int) pow(2, (code-48) / 12);

                // Play note 
                this.scale[scaleIndex].rate(rateDiff);
                this.scale[scaleIndex].amp(this.volume);
                this.scale[scaleIndex].pan(this.pan);
                this.scale[scaleIndex].stop();
                this.scale[scaleIndex].play();
            }

            // Move to next progression
            if (this.patternIndex == this.progression.length-1) {
                this.patternIndex = 0;
            } else {
                this.patternIndex++;
            }
        }

        // Incremement the step count
        this.divisionCount++;
    }


    public void changeVolume(float v) {
        this.volume = v;
    }

    public void changePan(float v) {
        this.pan = v;
    }
}
