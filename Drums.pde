// Drum instrument.
// Selects and plays a drum beat from a pattern bank.

public class Drums implements Instrument {
    // TODO: Load patternBank from file.

    // The pattern that is chosen and used.
    private DrumPattern pattern; 

    private DrumPattern[] patternBank;
    //    new DrumPattern(
    //    new boolean[] {true, false, true, false, false, false, false, false, true, false, true, false, false, false, false, false}, 
    //    new boolean[] {false, false, false, false, true, false, false, false, false, false, false, false, true, false, false, false}, 
    //    new boolean[] {true, false, true, false, true, false, true, false, true, false, true, false, true, false, true, false}, 
    //    new boolean[] {false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false}
    //    ), 
    //    new DrumPattern(
    //    new boolean[] {true, false, false, true, false, false, true, false, false, false, true, false, false, false, false, false}, 
    //    new boolean[] {false, false, false, false, true, false, false, false, false, false, false, false, true, false, false, false}, 
    //    new boolean[] {true, false, true, false, true, false, true, false, true, false, true, false, true, false, true, false}, 
    //    new boolean[] {false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false}
    //    ), 
    //    new DrumPattern(
    //    new boolean[] {true, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false}, 
    //    new boolean[] {false, false, false, false, true, false, false, false, false, false, false, false, true, false, false, false}, 
    //    new boolean[] {true, false, true, false, true, false, true, false, true, false, false, false, true, false, true, false}, 
    //    new boolean[] {false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false}
    //    )
    //};

    // Which division of the pattern the instrument is currently on.
    private int patternIndex = 0;

    // Load in soundFiles.
    SoundFile kick = new SoundFile(sketchPApplet, "samples/drums/kick.wav");
    SoundFile snare = new SoundFile(sketchPApplet, "samples/drums/snare.wav");
    SoundFile hihat = new SoundFile(sketchPApplet, "samples/drums/hihat.wav");
    SoundFile openhihat = new SoundFile(sketchPApplet, "samples/drums/openhihat.wav");


    public Drums() {
        this.loadPatterns();
        this.choosePattern();
    };


    public void choosePattern() {
        this.pattern = this.patternBank[int(random(0, this.patternBank.length))];
    }


    // Step forward one unit
    public void step() {
        if (this.pattern.kick[patternIndex]) {
            playNote("kick");
        }

        if (this.pattern.snare[patternIndex]) {
            playNote("snare");
            //println(this.pattern.snare[patternIndex]);
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
    public void playNote(String n) {
        switch(n) {
        case "kick":
            this.kick.stop();
            this.kick.play();
            //print("playing kick");
            break;
        case "snare":
            this.snare.stop();
            this.snare.play();
            //print("playing snare");
            break;
        case "hihat":
            this.hihat.stop();
            this.hihat.play();
            //print("playing hat");
            break;
        case "openhihat":
            this.openhihat.stop();
            this.openhihat.play();
            //print("playing openhat");
            break;
        }
    }

    public void loadPatterns() {
        String[] lines = loadStrings("bank/drums.txt");
        DrumPattern[] pb = new DrumPattern[lines.length / 5];
        for (int i = 0; i < lines.length/5; i++) {
            pb[i] = new DrumPattern(
            convertStrToBool(split(lines[i * 5], " ")),
            convertStrToBool(split(lines[i * 5 + 1], " ")),
            convertStrToBool(split(lines[i * 5 + 2], " ")),
            convertStrToBool(split(lines[i * 5 + 3], " "))
            );
        }
        printArray(pb[0].kick);
        this.patternBank = pb;
    }
    
    public boolean[] convertStrToBool(String[] a) {
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
