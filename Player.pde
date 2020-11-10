// Handles choosing progression, setting framerate, etc.

public class Player {
    // List of all used chord progressions. TODO: CHANGE TO TEXT FILE!
    Chord[][] progressions;
    //    {
    //        // also forgot
    //        new Chord(new Note(70), "7"), 
    //        new Chord(new Note(72), "m7"), 
    //        new Chord(new Note(74), "m7"), 
    //        new Chord(new Note(74), "m7")
    //    }, 
    //    {
    //        // forgot
    //        new Chord(new Note(62), "m9"), 
    //        new Chord(new Note(67), "9sus4"), 
    //        new Chord(new Note(57), "9sus4"), 
    //        new Chord(new Note(61), "d7")
    //    }, 
    //    {
    //        // Ebmaj7, F7sus2, G#maj7, G#maj7, Ebmaj7, F7sus2, C7sus2, C7sus2
    //        new Chord(new Note(63), "M7"), 
    //        new Chord(new Note(65), "sus2"), 
    //        new Chord(new Note(68), "M7"), 
    //        new Chord(new Note(68), "M7"), 
    //        new Chord(new Note(63), "M7"), 
    //        new Chord(new Note(65), "sus2"), 
    //        new Chord(new Note(60), "sus2"), 
    //        new Chord(new Note(60), "sus2")
    //    }
    //};


    Player() {
        this.loadProgressions();
        
        // Transpose each chord from the progression bank.
        for (Chord[] p : progressions) {
            transpose(p);
        }
        
        this.initializePlayer();
    }

    public void initializePlayer() {
        // Choose a random chord progression from the bank.
        Chord[] progression = progressions[(int) random(0, progressions.length)];

        this.setTempo();

        // Instantiate each instrument with the chord progression if
        // that instrument needs it.
        d = new Drums(); 
        b = new Bass(progression);  
        r = new Rhodes(progression);
        ra = new Rain();
        m = new Melody(progression);
        v = new Vinyl();
    }

    public void setTempo() {
        // Set the tempo. How many beats occur every minute.

        // Set the frameRate. This is how many times the draw() loop occurs every second.
        int frameRate = int(tempo/60*beatDivision);
        frameRate(frameRate);
    }

    // Transpose the chord by a random number of steps. -6 > diffSteps > 5
    public void transpose(Chord[] prog) {
        // Pick number of semitones to transpose the chord progression by.
        int diffSteps = (int) random(-6, 6);

        // For each note in each chord, change the note.
        for (Chord c : prog) {
            c.root.changeNote(c.root.keycode + diffSteps);
            for (Note n : c.chord) {
                n.changeNote(n.keycode + diffSteps);
            }

            for (int i = 1; i < c.scale.length; i++) {
                Note n = c.scale[i];
                n.changeNote(n.keycode + diffSteps);
            }
        }
    }
    
    public void loadProgressions() {
        // Generate letter => value map
        HashMap<String, Integer> hm = new HashMap<String, Integer>();
        String[] l = new String[] {"C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"};
        int[] n = new int[] {72, 73, 74, 63, 64, 65, 66, 67, 68, 69, 70, 71};
        for (int i = 0; i < l.length; i++) {
            hm.put(l[i], n[i]);
        }
        
        String[] lines = loadStrings("bank/progressions.txt");
        Chord[][] p = new Chord[lines.length][];
        
        // Go through each set of progressions
        for (int i = 0; i < lines.length; i++) {
            String[] currentLine = split(lines[i], " ");
            printArray(currentLine);
            Chord[] currentProg = new Chord[currentLine.length / 2];
            // Go through each chord
            
            for (int j = 0; j < currentLine.length / 2; j++) {
                String letter = currentLine[j * 2];
                int letterCode = hm.get(letter);
                String type = currentLine[j * 2 + 1];
                currentProg[j] = new Chord(new Note(letterCode), type);
            }
            p[i] = currentProg;
        }
        this.progressions = p;
    }
}
