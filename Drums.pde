// Drum instrument.
// Selects and plays a drum beat from a pattern bank.

public class Drums implements Instrument {

    // The pattern that is chosen and used.
    private DrumPattern pattern; 

    private DrumPattern[] patternBank;

    // Which division of the pattern the instrument is currently on.
    private int patternIndex = 0;

    // Load in soundFiles.
    private SoundFile kick = new SoundFile(sketchPApplet, "samples/drums/kick.wav");
    private SoundFile snare = new SoundFile(sketchPApplet, "samples/drums/snare.wav");
    private SoundFile hihat = new SoundFile(sketchPApplet, "samples/drums/hihat.wav");
    private SoundFile openhihat = new SoundFile(sketchPApplet, "samples/drums/openhihat.wav");


    public Drums() {
        this.loadPatterns();
        this.choosePattern();
    };


    private void choosePattern() {
        this.pattern = this.patternBank[int(random(0, this.patternBank.length))];
    }


    // Step forward one unit
    public void step() {
        if (this.pattern.kick[patternIndex]) {
            playNote("kick");
        }

        if (this.pattern.snare[patternIndex]) {
            playNote("snare");
        }

        if (this.pattern.hihat[patternIndex]) {
            playNote("hihat");
        }

        if (this.pattern.openhihat[patternIndex]) {
            playNote("openhihat");
        }

        if (this.patternIndex == this.pattern.kick.length - 1) {
            this.patternIndex = 0;
        } else {
            this.patternIndex++;
        }
    }

    // Play audio file
    private void playNote(String n) {
        switch(n) {
        case "kick":
            this.kick.stop();
            this.kick.play();
            break;
        case "snare":
            this.snare.stop();
            this.snare.play();
            break;
        case "hihat":
            this.hihat.stop();
            this.hihat.play();
            break;
        case "openhihat":
            this.openhihat.stop();
            this.openhihat.play();
            break;
        }
    }


    // Load drum patterns from a text file
    private void loadPatterns() {
        String[] lines = loadStrings("bank/drums.txt");
        // Each new pattern is 5 lines long. Split up the file into 5 line sections.
        DrumPattern[] pb = new DrumPattern[lines.length / 5];
        for (int i = 0; i < lines.length/5; i++) {
            pb[i] = new DrumPattern(
            convertStrToBool(split(lines[i * 5], " ")),
            convertStrToBool(split(lines[i * 5 + 1], " ")),
            convertStrToBool(split(lines[i * 5 + 2], " ")),
            convertStrToBool(split(lines[i * 5 + 3], " "))
            );
        }

        this.patternBank = pb;
    }
    

    // Convert 1 or 0 into true or false
    private boolean[] convertStrToBool(String[] a) {
        boolean[] r = new boolean[a.length];
        for (int u = 0; u < a.length; u++) {
            if (a[u].equals("1")) {
                r[u] = true;
            } else {
                r[u] = false;
            }
        }
        
        return r;
    }
    

    // Change the volume of all drums. Volume must be
    // between 0.0 and 1.0
    public void changeVolume(float v) {
        this.kick.amp(v);
        this.snare.amp(v);
        this.hihat.amp(v);
        this.openhihat.amp(v);
    }

    public void changePan(float v) {
        this.kick.pan(v);
        this.snare.pan(v);
        this.hihat.pan(v);
        this.openhihat.pan(v);
    }
}
