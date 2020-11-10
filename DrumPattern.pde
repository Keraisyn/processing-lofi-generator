// DrumPattern object.
// Hold drum patterns for easier usage.

public class DrumPattern {
    public boolean[] kick;
    public boolean[] snare;
    public boolean[] hihat;
    public boolean[] openhihat;
    
    // Empty constructor
    public DrumPattern() {}
    
    // Defined pattern constructor
    public DrumPattern(boolean[] kick, boolean[] snare, boolean[] hihat, boolean[] openhihat) {
        this.kick = kick;
        this.snare = snare;
        this.hihat = hihat;
        this.openhihat = openhihat;
    }
}
