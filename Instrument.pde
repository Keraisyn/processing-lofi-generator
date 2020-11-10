// Instrument interface.
// Keep different instruments standardized to simplify adding
// more features and instruments in the future.

public interface Instrument {
    // Each instrument should have a function on each step
    public void step();
    

    // Each instrument should have adjustable volume and pan 
    // to use with the mixer.
    public void changeVolume(float v);


    public void changePan(float v);
    
    //public void choosePattern();
}
