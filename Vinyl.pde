// Vinyl instrument
// Plays a vinyl clicking sound effect.

class Vinyl implements Instrument {
    SoundFile vinylSample = new SoundFile(sketchPApplet, "samples/vinyl/vinyl1.wav");

    // Default volume and pan
    public float volume = 0.5;

    public float pan = 0.0;


    public Vinyl() {
        this.vinylSample.amp(this.volume);
        this.vinylSample.pan(this.pan);

        // Continuously play
        this.vinylSample.loop();
    }


    // Change volume and pan
    public void changeVolume(float v) {
        this.volume = v;
        this.vinylSample.amp(this.volume);
    }


    public void changePan(float v) {
        this.pan = v;
        this.vinylSample.pan(this.pan);
    }


    public void step() {
        // Do nothing during step
    }
}
