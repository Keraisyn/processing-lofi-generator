// Note objects
// Store music notes in a friendly format

public class Note {
    // Note data fields
    public int keycode;
    public String keyname;
    public float frequency;

    private String[] noteList = {"C", "C#", "D", "Eb", "E", "F", "F#", "G", "Ab", "A", "Bb", "B"};


    public Note(int keycode) {
        this.keycode = keycode;
        this.setNote(this.keycode);
        this.setFrequency(this.keycode);
    }


    // Change an existing note
    public void changeNote(int keycode) {
        this.keycode = keycode;
        this.setNote(this.keycode);
        this.setFrequency(this.keycode);
    }


    // Get note name with keycode
    private void setNote(int keycode) {
        this.keyname = this.noteList[(keycode - 12) % 12] + ((keycode - 12) / 12);
    }


    // Calculate frequency given keycode
    private void setFrequency(int keycode) {
        float f = pow(2, (keycode - 69)/12.0) * 440;
        this.frequency = f;
    }
}
