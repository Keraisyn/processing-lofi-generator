public class Drums implements Instrument {
    // TODO: Load patternBank from file.

    private DrumPattern pattern;    
    private DrumPattern[] patternBank = {
        new DrumPattern(
        new boolean[] {true, false, true, false, false, false, false, false, true, false, true, false, false, false, false, false}, 
        new boolean[] {false, false, false, false, true, false, false, false, false, false, false, false, true, false, false, false}, 
        new boolean[] {true, false, true, false, true, false, true, false, true, false, true, false, true, false, true, false}, 
        new boolean[] {false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false}
        ), 
        new DrumPattern(
        new boolean[] {true, false, false, true, false, false, true, false, false, false, true, false, false, false, false, false}, 
        new boolean[] {false, false, false, false, true, false, false, false, false, false, false, false, true, false, false, false}, 
        new boolean[] {true, false, true, false, true, false, true, false, true, false, true, false, true, false, true, false}, 
        new boolean[] {false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false}
        ), 
        new DrumPattern(
        new boolean[] {true, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false}, 
        new boolean[] {false, false, false, false, true, false, false, false, false, false, false, false, true, false, false, false}, 
        new boolean[] {true, false, true, false, true, false, true, false, true, false, false, false, true, false, true, false}, 
        new boolean[] {false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false}
        )
    };
    private int patternIndex = 0;

    // SoundFiles
    SoundFile kick = new SoundFile(sketchPApplet, "samples/drums/kick.wav");
    SoundFile snare = new SoundFile(sketchPApplet, "samples/drums/snare.wav");
    SoundFile hihat = new SoundFile(sketchPApplet, "samples/drums/hihat.wav");
    SoundFile openhihat = new SoundFile(sketchPApplet, "samples/drums/openhihat.wav");

    public Drums() {
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
}
