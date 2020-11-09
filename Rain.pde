// Rain sound effect

public class Rain implements Instrument {
    // TODO: Different rain sounds??
    SoundFile rainSample = new SoundFile(sketchPApplet, "samples/rain/rain1.mp3");

    // Main volume
    public float volume = 0.7;


    public Rain() {
        this.rainSample.amp(this.volume);
        
        // Play on instantiation and continue looping
        this.rainSample.loop();
    }


    public void changeVolume(float v) {
        this.volume = v;
        this.rainSample.amp(this.volume);
    }


    public void step() {
        // Don't do anything on step because the rain
        // sample is already looping from the constructor.
    }
}
