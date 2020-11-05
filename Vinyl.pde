class Vinyl implements Instrument {
    SoundFile vinylSample = new SoundFile(sketchPApplet, "samples/vinyl/vinyl1.wav");
    
    public Vinyl() {
        this.vinylSample.amp(0.5);
        this.vinylSample.loop();
    }
    
    public void step() {
        
    }
}
