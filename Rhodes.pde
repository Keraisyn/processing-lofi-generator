public class Rhodes {
    // Load individual samples from C3 - B3 (48 - 59)
    private SoundFile[] scale = {
        new SoundFile(sketchPApplet, "samples/rhodes/c3.aiff"), new SoundFile(sketchPApplet, "samples/rhodes/c#3.aiff"), new SoundFile(sketchPApplet, "samples/rhodes/d3.aiff"), 
        new SoundFile(sketchPApplet, "samples/rhodes/d#3.aiff"), new SoundFile(sketchPApplet, "samples/rhodes/e3.aiff"), new SoundFile(sketchPApplet, "samples/rhodes/f3.aiff"), 
        new SoundFile(sketchPApplet, "samples/rhodes/f#3.aiff"), new SoundFile(sketchPApplet, "samples/rhodes/g3.aiff"), new SoundFile(sketchPApplet, "samples/rhodes/g#3.aiff"), 
        new SoundFile(sketchPApplet, "samples/rhodes/a3.aiff"), new SoundFile(sketchPApplet, "samples/rhodes/a#3.aiff"), new SoundFile(sketchPApplet, "samples/rhodes/b3.aiff")
    };
    private int divisionCount = 0;
    private int patternIndex = 0;
    private ArrayList<LowPass> lpFilters = new ArrayList<LowPass>();
    private ArrayList<HighPass> hpFilters = new ArrayList<HighPass>();

    private Chord[] progression;

    public Rhodes(Chord[] progression) {
        this.progression = progression;
        this.applyEffects();
    }

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
        if (this.divisionCount % (beatDivision * 4) == 0) {
            for (Note note : this.progression[patternIndex].chord) {
                int code = note.keycode;
                this.scale[code % 12].rate(2);
                this.scale[code % 12].amp(0.5);
                this.scale[code % 12].play();
            }

            if (this.patternIndex == this.progression.length-1) {
                this.patternIndex = 0;
            } else {
                this.patternIndex++;
            }
        }

        this.divisionCount++;
    }
}
