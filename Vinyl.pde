class Vinyl implements Instrument {
    SoundFile vinylSample = new SoundFile(sketchPApplet, "samples/vinyl/vinyl1.wav");

    public float volume = 0.5;

    public Vinyl() {
        this.vinylSample.amp(this.volume);
        this.vinylSample.loop();
    }

    public void changeVolume(float v) {
        this.vinylSample.amp(this.volume);
        this.volume = v;
    }

    public void step() {
    }
}
