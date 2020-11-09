// Instrument interface.
// Keep different instruments standardized to simplify adding
// more features and instruments in the future.

public interface Instrument {
    public void step();
    
    public void changeVolume(float v);
    
    //public void choosePattern();
}
