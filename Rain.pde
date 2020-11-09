public class Rain implements Instrument {
    SoundFile rainSample = new SoundFile(sketchPApplet, "samples/rain/rain1.mp3");

    public float volume = 0.7;

    public Rain() {
        this.rainSample.amp(this.volume);
        this.rainSample.loop();
    }

    public void changeVolume(float v) {
        this.volume = v;
        this.rainSample.amp(this.volume);
    }

    public void step() {
        // Do nothing...
    }
}
