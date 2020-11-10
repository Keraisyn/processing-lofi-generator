// Melody instrument.
// Continously generates a melody with the chord progression.

public class Melody {

    // Default values
    private int voiceTarget = 55;
    private Note lastNote = new Note(60);
    public float volume = 0.5;
    public float pan = 0.0;

    // Load individual samples from C3 - B3 (48 - 59)
    private SoundFile[] scale = {
        new SoundFile(sketchPApplet, "samples/rhodes/c3.aiff"), new SoundFile(sketchPApplet, "samples/rhodes/c#3.aiff"), new SoundFile(sketchPApplet, "samples/rhodes/d3.aiff"), 
        new SoundFile(sketchPApplet, "samples/rhodes/d#3.aiff"), new SoundFile(sketchPApplet, "samples/rhodes/e3.aiff"), new SoundFile(sketchPApplet, "samples/rhodes/f3.aiff"), 
        new SoundFile(sketchPApplet, "samples/rhodes/f#3.aiff"), new SoundFile(sketchPApplet, "samples/rhodes/g3.aiff"), new SoundFile(sketchPApplet, "samples/rhodes/g#3.aiff"), 
        new SoundFile(sketchPApplet, "samples/rhodes/a3.aiff"), new SoundFile(sketchPApplet, "samples/rhodes/a#3.aiff"), new SoundFile(sketchPApplet, "samples/rhodes/b3.aiff")
    };

    // Declare rhythm bank
    private boolean[][] rhythmBank;

    // Progression for this instrument
    private Chord[] progression;

    // Indices for keeping track of beats/chords
    private int divisionCount = 0;
    private int patternIndex = 0;
    private int barIndex = 0;

    // One bar of music rhythms.
    private boolean[] bar;
    private int barSteps;


    public Melody(Chord[] progression) {
        this.loadRhythms();
        this.barSteps = beatDivision * barLength;
        this.bar = new boolean[this.barSteps];
        this.progression = progression;
    }


    // Find the closest distance between two notes
    private int findDistance(int a, int b) {
        int difference = a - b;

        int changeValue = difference / 12 * 12;
        difference = difference - changeValue;

        // Now, change the note so it is nearest the target
        if (difference > 6) {
            return abs(difference - 12);
        } else if (difference < -6) {
            return abs(difference + 12);
        } else {
            return abs(difference);
        }
    }

    // Melody generating function
    private Note pickNote(Note lastNote, Chord currentChord) {
        // Try tweaking the arrays for change melody generation!
        
        // How desirable each degree of the chord is. Higher the number, the more 
        // desirable it is. Index 0 has no meaning.
        // Scale degrees:               x, 1, 2, 3, 4, 5, 6, 7
        int[] degreeScores = new int[] {0, 8, 4, 9, 3, 9, 2, 6};

        // How desirability scales depending on distance from lastNote. 6 is the
        // furthest distance two notes can be from each other.
        // Distances (semitones):         0, 1, 2, 3, 4, 5, 6 
        int[] distanceScores = new int[] {4, 8, 8, 7, 7, 6, 5};

        int[] finalScores = new int[8];

        // Go through each scale degree to determine probabilities.
        for (int i = 1; i < currentChord.scale.length; i++) {
            // Smallest distance between lastNote and each scale degree.
            int distance = findDistance(lastNote.keycode, currentChord.scale[i].keycode);

            // Determine new score by multiplying the scale degree by the distance.
            int newScore = distanceScores[distance] * degreeScores[i];

            // Save the score.
            finalScores[i] = newScore;
        }

        // Choose a final degree with probabilities.
        int sum = Utility.sumArray(finalScores);
        int t = (int) random(1, sum);
        int cumulativeProb = 0;
        int targetDegree = 1;

        for (int i = 1; i < finalScores.length; i++) {
            cumulativeProb += finalScores[i];
            if (t <= cumulativeProb) {
                // Choose which scale degree we want.
                targetDegree = i;
                break;
            }
        }

        // Finally, return the new note.
        return new Note(currentChord.scale[targetDegree].keycode);
    }


    public void step() {

        // Run at the beginning of each bar. Changes the chord
        // and generates new melody notes.
        if (this.divisionCount % (beatDivision * 4) == 0) {
            this.barIndex = 0;

            // Change chord
            if (this.patternIndex == this.progression.length-1 || divisionCount == 0) {
                this.patternIndex = 0;
            } else {
                this.patternIndex++;
            }

            // How many steps of the bar have been filled
            int filledSteps = 0;

            // Complete the bar rhythms
            while (filledSteps < barSteps) {
                boolean[] rhythmChoice = this.rhythmBank[(int) random(0, this.rhythmBank.length)];

                // Length in steps
                int rhythmLength = rhythmChoice.length;

                // Check if there's room for the pattern
                if (filledSteps + rhythmLength <= barSteps) {
                    for (int i = 0; i < rhythmLength; i++) {
                        if (rhythmChoice[i]) {
                            this.bar[filledSteps + i] = true;
                        } else {
                            this.bar[filledSteps + i] = false;
                        }
                    }
                }

                filledSteps += rhythmLength;
            }
        }

        // If this step is a played step according to generated rhythms.
        if (this.bar[this.barIndex]) {

            Note note = this.pickNote(this.lastNote, this.progression[patternIndex]);
            this.lastNote = note;
            int code = note.keycode;

            // Which index of the scale array is to be used
            int scaleIndex = code % 12;    

            // Calculate the rate at which the soundfile will be played.
            // The formula to find this is 2^(octave change). For example,
            // an octave up will have rate 2^1 = 2. An octave down will have
            // rate 2 ^ -1 = 0.5.
            int rateDiff = (int) pow(2, (code-48) / 12 - 1);

            // Play note 
            this.scale[scaleIndex].rate(rateDiff);
            this.scale[scaleIndex].amp(this.volume);
            this.scale[scaleIndex].pan(this.pan);
            this.scale[scaleIndex].stop();
            this.scale[scaleIndex].play();
        }

        this.barIndex++;

        // Keep a running tally of divisions.
        this.divisionCount++;
    }


    // Load rhythms from text file rhythm bank
    public void loadRhythms() {
        String[] lines = loadStrings("bank/rhythms.txt");
        boolean[][] rb = new boolean[lines.length][];
        for (int i = 0; i < lines.length; i++) {
            rb[i] = this.convertStrToBool(split(lines[i], " "));
        }
        this.rhythmBank = rb;
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


    // Change volume and pan
    public void changeVolume(float v) {
        this.volume = v;
    }


    public void changePan(float v) {
        this.pan = v;
    }
}
