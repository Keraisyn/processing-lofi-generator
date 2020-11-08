public class Rain implements Instrument {
    SoundFile rainSample = new SoundFile(sketchPApplet, "samples/rain/rain1.mp3");
    
    public Rain() {
        this.rainSample.amp(0.7);
        this.rainSample.loop();
    }
    
    public void step() {
        // Do nothing...
    }
}
