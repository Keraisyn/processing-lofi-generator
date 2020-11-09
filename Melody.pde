// Melody instrument.
// Continously generates a melody with the chord progression.

public class Melody {

    private int voiceTarget = 60;
    private Note lastNote = new Note(60);

    // Load individual samples from C3 - B3 (48 - 59)
    private SoundFile[] scale = {
        new SoundFile(sketchPApplet, "samples/rhodes/c3.aiff"), new SoundFile(sketchPApplet, "samples/rhodes/c#3.aiff"), new SoundFile(sketchPApplet, "samples/rhodes/d3.aiff"), 
        new SoundFile(sketchPApplet, "samples/rhodes/d#3.aiff"), new SoundFile(sketchPApplet, "samples/rhodes/e3.aiff"), new SoundFile(sketchPApplet, "samples/rhodes/f3.aiff"), 
        new SoundFile(sketchPApplet, "samples/rhodes/f#3.aiff"), new SoundFile(sketchPApplet, "samples/rhodes/g3.aiff"), new SoundFile(sketchPApplet, "samples/rhodes/g#3.aiff"), 
        new SoundFile(sketchPApplet, "samples/rhodes/a3.aiff"), new SoundFile(sketchPApplet, "samples/rhodes/a#3.aiff"), new SoundFile(sketchPApplet, "samples/rhodes/b3.aiff")
    };


    // Rhythm bank. The length is not limited to 4, although the rhythms work 
    // best in 4/4 time.
    // Structure 
    private boolean[][] rhythmBank = {
        {true, false, false, false},  // Single quarter
        {true, false, true, false},   // Two eighths
        {true, false, false, true},   // Dotted eighth
        {true, true, true, true},     // Four sixteenths
    };


    private Chord[] progression;

    private int divisionCount = 0;
    private int patternIndex = 0;

    public Melody(Chord[] progression) {
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

    // Here is the big daddy melody generating function
    private Note pickNote(Note lastNote, Chord currentChord) {
        // How desirable each degree of the chord is. Higher the number, the more 
        // desirable it is. Index 0 has no meaning.
        // Scale degrees:               x, 1, 2, 3, 4, 5, 6, 7
        int[] degreeScores = new int[] {0, 8, 6, 9, 4, 8, 2, 9};

        // How desirability scales depending on distance from lastNote. 6 is the
        // furthest distance two notes can be from each other.
        // Distances (semitones):         0, 1, 2, 3, 4, 5, 6 
        int[] distanceScores = new int[] {5, 8, 8, 7, 7, 6, 5};

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

        printArray(finalScores);
        // Choose a final degree with probabilities.
        int sum = Utility.sumArray(finalScores);
        int t = (int) random(1, sum);
        println("t", t);
        int cumulativeProb = 0;
        int targetDegree = 0;

        for (int i = 1; i < finalScores.length; i++) {
            cumulativeProb += finalScores[i];
            println("cumulative:", cumulativeProb);
            if (t <= cumulativeProb) {
                // Choose which scale degree we want.
                targetDegree = i;
                break;
            }
        }

        // Finally, return the new note.
        println("melody wants to play:", targetDegree);
        return new Note(currentChord.scale[targetDegree].keycode);
    }

    public void step() {
        if (this.divisionCount % 8 == 0) {
            Note note = this.pickNote(this.lastNote, this.progression[patternIndex]);
            this.lastNote = note;
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
            this.scale[scaleIndex].amp(0.5);
            this.scale[scaleIndex].stop();
            this.scale[scaleIndex].play();
        }

        // Handle chord changes
        if (this.divisionCount % (beatDivision * 4) == 0) {
            if (this.patternIndex == this.progression.length-1) {
                this.patternIndex = 0;
            } else {
                this.patternIndex++;
            }
        }

        // Keep a running tally of divisions.
        this.divisionCount++;
    }
}
