// Rain sound effect

public class Rain implements Instrument {
    SoundFile rainSample = new SoundFile(sketchPApplet, "samples/rain/rain1.mp3");

    // Volume and pan fields
    public float volume = 0.7;

    public float pan = 0.0;


    public Rain() {
        this.rainSample.amp(this.volume);

        // Play on instantiation and continue looping
        this.rainSample.loop();
    }


    // Value changing
    public void changeVolume(float v) {
        this.volume = v;
        this.rainSample.amp(this.volume);
    }


    public void changePan(float v) {
        this.pan = v;
        this.rainSample.pan(this.pan);
    }


    public void step() {
        // Don't do anything on step because the rain
        // sample is already looping from the constructor.
    }
}
