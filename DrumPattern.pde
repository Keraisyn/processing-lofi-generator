public class DrumPattern {
    boolean[] kick;
    boolean[] snare;
    boolean[] hihat;
    boolean[] openhihat;
    
    // Empty constructor
    DrumPattern() {}
    
    // Defined pattern constructor
    DrumPattern(boolean[] kick, boolean[] snare, boolean[] hihat, boolean[] openhihat) {
        this.kick = kick;
        this.snare = snare;
        this.hihat = hihat;
        this.openhihat = openhihat;
    }
}
