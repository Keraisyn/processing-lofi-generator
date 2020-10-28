public class Bass {
    Note[] notes;
    SinOsc sine = new SinOsc(sketchPApplet);
    private int patternIndex = 0;
    private int divisionCount = 0;
    private int bassRange = 70;


    public Bass(Chord[] progression) {
        this.getNotes(progression);
    }

    public void getNotes(Chord[] progression) {
        this.notes = new Note[progression.length];
        for (int i = 0; i < progression.length; i++) {
            this.notes[i] = progression[i].root;
        }
    }

    public void step() {
        if (this.divisionCount % (beatDivision * 4) == 0) {
            this.sine.stop();
            float frequency = this.notes[this.patternIndex].frequency;
            // Bring note into bass territory
            float adjustedFrequency = frequency / (pow(2, 3));
            println(adjustedFrequency, frequency);
            this.sine.freq(adjustedFrequency);
            this.sine.play();

            if (this.patternIndex == this.notes.length-1) {
                this.patternIndex = 0;
            } else {
                this.patternIndex++;
            }
        }

        this.divisionCount++;
    }
}
