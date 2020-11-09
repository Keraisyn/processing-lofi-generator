// Chord object.
// Has 3 important fields: root of the chord, notes of the chord,
// and scale degree notes of the chord.

public class Chord {
    // Store root note separately as well.
    Note root;
    
    // Chord type (m7, M7, 7, m9, etc)
    String type;
    
    // Chord notes only.
    Note[] chord;
    
    // Scale degrees of the chord.
    Note[] scale;

    // Constructor takes the root note and the type of chord
    public Chord (Note root, String type) {
        this.root = root;
        this.type = type;

        // Generate notes depending on chord type
        this.findNotes(this.root, this.type);
    }


    // Voice the chord around a target note
    public void voice(int target) {
        // Go through each note in the chord
        for (Note n : this.chord) {

            // Get difference in code
            int difference = n.keycode - target;

            // If difference is larger than 12, bring it down enough octaves into range   
            if (abs(difference) > 12) {
                int changeValue = difference / 12 * 12;
                difference = difference - changeValue;
                n.keycode = n.keycode - changeValue;
            }

            // Now, change the note so it is nearest the target
            if (difference > 6) {
                n.keycode = n.keycode - 12;
            } else if (difference < -6) {
                n.keycode = n.keycode + 12;
            }
        }
    }


    // Generate notes depending on chord type
    public void findNotes(Note root, String type) {
        int[] notes;
        int[] scaleCodes;
        int r = this.root.keycode;

        // Get keycodes of chord and scale depending on type.
        switch (type) {
        case "m":
            // Minor triad
            notes = new int[] {r, r + 3, r + 7};
            scaleCodes = new int[] {0, r, r+2, r+3, r+5, r+7, r+9, r+10};
            break;
        case "M":
            // Major triad
            notes = new int[] {r, r + 4, r + 7};
            scaleCodes = new int[] {0, r, r+2, r+4, r+5, r+7, r+9, r+11};
            break;
        case "d7":
            // Diminished 7th
            notes = new int[] {r, r + 3, r + 6, r + 9};
            scaleCodes = new int[] {0, r, r+2, r+3, r+5, r+6, r+8, r+9};
            break;
        case "m7":
            // Minor 7th
            notes = new int[] {r, r + 3, r + 7, r + 10};
            scaleCodes = new int[] {0, r, r+2, r+3, r+5, r+7, r+9, r+10};
            break;
        case "M7":
            // Major 7th
            notes = new int[] {r, r + 4, r + 7, r + 11};
            scaleCodes = new int[] {0, r, r+2, r+4, r+5, r+7, r+9, r+11};
            break;
        case "7":
            // (Dominant) 7th
            notes = new int[] {r, r + 4, r + 7, r + 10};
            scaleCodes = new int[] {0, r, r+2, r+4, r+5, r+7, r+9, r+10};
            break;
        case "m9":
            // Minor 9th
            notes = new int[] {r, r + 3, r + 7, r + 10, r + 13};
            scaleCodes = new int[] {0, r, r+2, r+3, r+5, r+7, r+9, r+10};
            break;
        case "sus2":
            // Minor 9th
            notes = new int[] {r, r + 2, r + 7, r + 10};
            scaleCodes = new int[] {0, r, r+2, r+3, r+5, r+7, r+9, r+10};
            break;
        case "9sus4":
            // Minor 9th
            notes = new int[] {r, r + 5, r + 7, r + 10, r + 13};
            scaleCodes = new int[] {0, r, r+2, r+3, r+5, r+7, r+9, r+10};
            break;
        default:
            notes = new int[0];
            scaleCodes = new int[0];
        }

        // Convert to Note objects
        this.chord = new Note[notes.length];
        for (int i = 0; i < notes.length; i++) {
            this.chord[i] = new Note(notes[i]);
        }
        
        
        // Convert to Note objects
        this.scale = new Note[scaleCodes.length];
        for (int i = 1; i < scaleCodes.length; i++) {
            this.scale[i] = new Note(scaleCodes[i]);
        }
    }

    //// Find scale degrees for melody instruments
    //public void findScale(Note root, String type) {
    //    int r = this.root.keycode;
    //    int[] scaleCodes;
    //    switch(type) {
    //    case "major":
    //        scaleCodes = new int[] {0, r, r+2, r+4, r+5, r+7, r+9, r+11};
    //        break;
    //    case "minor":
    //        scaleCodes = new int[] {0, r, r+2, r+3, r+5, r+7, r+9, r+10};
    //        break;
    //    default:
    //        scaleCodes = new int[0];
    //    }

    //    // Convert to Note objects
    //    this.scale = new Note[scaleCodes.length];
    //    for (int i = 1; i < scaleCodes.length - 1; i++) {
    //        this.scale[i] = new Note(scaleCodes[i]);
    //    }
    //}
}
