public class Note {
    int keycode;
    String keyname;
    float frequency;
    private String[] noteList = {"C", "C#", "D", "Eb", "E", "F", "F#", "G", "Ab", "A", "Bb", "B"};

    Note(int keycode) {
        this.keycode = keycode;
        this.setNote(this.keycode);
        this.setFrequency(this.keycode);
    }

    public void changeNote(int keycode) {
        this.keycode = keycode;
        this.setNote(this.keycode);
        this.setFrequency(this.keycode);
    }

    private void setNote(int keycode) {
        this.keyname = this.noteList[(keycode - 12) % 12] + ((keycode - 12) / 12);
    }

    private void setFrequency(int keycode) {
        float f = pow(2, (keycode - 69)/12.0) * 440;
        print(f);
        this.frequency = f;
    }
}
