public class Chord {
    Note root;
    // Chord type (m7, M7, 7, m9, etc)
    String type;
    Note[] chord;

    public Chord (Note root, String type) {
        this.root = root;
        this.type = type;
    }

    public void findNotes(int root, String type) {
        int[] notes;
        int r = this.root.keycode;

        // Get keycodes of chord
        switch (type) {
        case "m":
            // Minor triad
            notes = new int[] {r, r + 3, r + 7};
            break;
        case "M":
            // Major triad
            notes = new int[] {r, r + 4, r + 7};
            break;
        case "d7":
            // Diminished 7th
            notes = new int[] {r, r + 3, r + 6, r + 9};
            break;
        case "m7":
            // Minor 7th
            notes = new int[] {r, r + 3, r + 7, r + 10};
            break;
        case "M7":
            // Major 7th
            notes = new int[] {r, r + 4, r + 7, r + 11};
            break;
        case "7":
            // (Dominant) 7th
            notes = new int[] {r, r + 4, r + 7, r + 10};
            break;
        case "m9":
            // Minor 9th
            notes = new int[] {r, r + 3, r + 7, r + 10, r + 13};
            break;
        default:
            notes = new int[0];
        }

        // Convert to Note objects
        this.chord = new Note[notes.length];
        for (int i = 0; i < notes.length; i++) {
            this.chord[i] = new Note(notes[i]);
        }
    }
}
