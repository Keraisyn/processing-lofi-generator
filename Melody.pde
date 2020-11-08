public class Melody {

    private int voiceTarget = 60;

    // Load individual samples from C3 - B3 (48 - 59)
    private SoundFile[] scale = {
        new SoundFile(sketchPApplet, "samples/rhodes/c3.aiff"), new SoundFile(sketchPApplet, "samples/rhodes/c#3.aiff"), new SoundFile(sketchPApplet, "samples/rhodes/d3.aiff"), 
        new SoundFile(sketchPApplet, "samples/rhodes/d#3.aiff"), new SoundFile(sketchPApplet, "samples/rhodes/e3.aiff"), new SoundFile(sketchPApplet, "samples/rhodes/f3.aiff"), 
        new SoundFile(sketchPApplet, "samples/rhodes/f#3.aiff"), new SoundFile(sketchPApplet, "samples/rhodes/g3.aiff"), new SoundFile(sketchPApplet, "samples/rhodes/g#3.aiff"), 
        new SoundFile(sketchPApplet, "samples/rhodes/a3.aiff"), new SoundFile(sketchPApplet, "samples/rhodes/a#3.aiff"), new SoundFile(sketchPApplet, "samples/rhodes/b3.aiff")
    };

    private Chord[] progression;

    public Melody(Chord[] progression) {
        this.progression = progression;
    }

    private Note pickNote(Note lastNote) {
        
    }

    public void step() {
        
    }
}
