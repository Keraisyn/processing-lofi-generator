/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void melody_volume_change(GSlider source, GEvent event) { //_CODE_:melody_volume:706844:
  println("melody_volume - GSlider >> GEvent." + event + " @ " + millis());
  m.changeVolume(1.0-melody_volume.getValueF());
} //_CODE_:melody_volume:706844:

public void rhodes_volume_change(GSlider source, GEvent event) { //_CODE_:rhodes_volume:361035:
  println("slider1 - GSlider >> GEvent." + event + " @ " + millis());
  r.changeVolume(1.0-rhodes_volume.getValueF());
} //_CODE_:rhodes_volume:361035:

public void bass_volume_change(GSlider source, GEvent event) { //_CODE_:bass_volume:878821:
  println("slider2 - GSlider >> GEvent." + event + " @ " + millis());
  b.changeVolume(1.0-bass_volume.getValueF());
} //_CODE_:bass_volume:878821:

public void drums_volume_change(GSlider source, GEvent event) { //_CODE_:drums_volume:526970:
  println("slider3 - GSlider >> GEvent." + event + " @ " + millis());
  d.changeVolume(1.0-drums_volume.getValueF());
} //_CODE_:drums_volume:526970:

public void rain_volume_change(GSlider source, GEvent event) { //_CODE_:rain_volume:988954:
  println("slider4 - GSlider >> GEvent." + event + " @ " + millis());
  ra.changeVolume(1.0-rain_volume.getValueF());
} //_CODE_:rain_volume:988954:

public void vinyl_volume_change(GSlider source, GEvent event) { //_CODE_:vinyl_volume:922849:
  println("slider5 - GSlider >> GEvent." + event + " @ " + millis());
  v.changeVolume(1.0-vinyl_volume.getValueF());
} //_CODE_:vinyl_volume:922849:

public void start_button_click(GButton source, GEvent event) { //_CODE_:start_button:465175:
  println("button1 - GButton >> GEvent." + event + " @ " + millis());
  globalSound.volume(master_volume.getValueF());
  running = true;
} //_CODE_:start_button:465175:

public void stop_button_click(GButton source, GEvent event) { //_CODE_:stop_button:456277:
  println("button2 - GButton >> GEvent." + event + " @ " + millis());
  globalSound.volume(0);
  running = false;
} //_CODE_:stop_button:456277:

public void master_volume_change(GKnob source, GEvent event) { //_CODE_:master_volume:562941:
  println("master_volume - GKnob >> GEvent." + event + " @ " + millis());
  globalSound.volume(master_volume.getValueF());
} //_CODE_:master_volume:562941:

public void button3_click1(GButton source, GEvent event) { //_CODE_:button3:258491:
  println("button3 - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:button3:258491:

public void tempo_change(GKnob source, GEvent event) { //_CODE_:tempo:606296:
  println("tempo - GKnob >> GEvent." + event + " @ " + millis());
  int fr = int(tempo.getValueF()/60*beatDivision);
  println(fr);
  frameRate(fr);
} //_CODE_:tempo:606296:

public void checkbox1_clicked1(GCheckbox source, GEvent event) { //_CODE_:checkbox1:615215:
  println("checkbox1 - GCheckbox >> GEvent." + event + " @ " + millis());
} //_CODE_:checkbox1:615215:

public void checkbox2_clicked1(GCheckbox source, GEvent event) { //_CODE_:checkbox2:730507:
  println("checkbox2 - GCheckbox >> GEvent." + event + " @ " + millis());
} //_CODE_:checkbox2:730507:

public void melody_pan_change(GKnob source, GEvent event) { //_CODE_:melody_pan:247310:
  println("melody_pan - GKnob >> GEvent." + event + " @ " + millis());
} //_CODE_:melody_pan:247310:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  melody_volume = new GSlider(this, 70, 250, 200, 40, 10.0);
  melody_volume.setRotation(PI/2, GControlMode.CORNER);
  melody_volume.setLimits(0.5, 0.0, 1.0);
  melody_volume.setNumberFormat(G4P.DECIMAL, 2);
  melody_volume.setOpaque(false);
  melody_volume.addEventHandler(this, "melody_volume_change");
  rhodes_volume = new GSlider(this, 150, 250, 200, 40, 10.0);
  rhodes_volume.setRotation(PI/2, GControlMode.CORNER);
  rhodes_volume.setLimits(0.5, 0.0, 1.0);
  rhodes_volume.setNumberFormat(G4P.DECIMAL, 2);
  rhodes_volume.setOpaque(false);
  rhodes_volume.addEventHandler(this, "rhodes_volume_change");
  bass_volume = new GSlider(this, 230, 250, 200, 40, 10.0);
  bass_volume.setRotation(PI/2, GControlMode.CORNER);
  bass_volume.setLimits(0.5, 0.0, 1.0);
  bass_volume.setNumberFormat(G4P.DECIMAL, 2);
  bass_volume.setOpaque(false);
  bass_volume.addEventHandler(this, "bass_volume_change");
  drums_volume = new GSlider(this, 310, 250, 200, 40, 10.0);
  drums_volume.setRotation(PI/2, GControlMode.CORNER);
  drums_volume.setLimits(0.0, 0.0, 1.0);
  drums_volume.setNumberFormat(G4P.DECIMAL, 2);
  drums_volume.setOpaque(false);
  drums_volume.addEventHandler(this, "drums_volume_change");
  rain_volume = new GSlider(this, 390, 250, 200, 40, 10.0);
  rain_volume.setRotation(PI/2, GControlMode.CORNER);
  rain_volume.setLimits(0.5, 0.0, 1.0);
  rain_volume.setNumberFormat(G4P.DECIMAL, 2);
  rain_volume.setOpaque(false);
  rain_volume.addEventHandler(this, "rain_volume_change");
  vinyl_volume = new GSlider(this, 470, 250, 200, 40, 10.0);
  vinyl_volume.setRotation(PI/2, GControlMode.CORNER);
  vinyl_volume.setLimits(0.3, 0.0, 1.0);
  vinyl_volume.setNumberFormat(G4P.DECIMAL, 2);
  vinyl_volume.setOpaque(false);
  vinyl_volume.addEventHandler(this, "vinyl_volume_change");
  start_button = new GButton(this, 340, 10, 80, 30);
  start_button.setText("Start");
  start_button.addEventHandler(this, "start_button_click");
  stop_button = new GButton(this, 340, 60, 80, 30);
  stop_button.setText("Stop");
  stop_button.addEventHandler(this, "stop_button_click");
  master_volume = new GKnob(this, 100, 20, 60, 60, 0.8);
  master_volume.setTurnRange(110, 70);
  master_volume.setTurnMode(GKnob.CTRL_HORIZONTAL);
  master_volume.setSensitivity(1);
  master_volume.setShowArcOnly(false);
  master_volume.setOverArcOnly(false);
  master_volume.setIncludeOverBezel(false);
  master_volume.setShowTrack(true);
  master_volume.setLimits(1.0, 0.0, 1.0);
  master_volume.setShowTicks(true);
  master_volume.setOpaque(false);
  master_volume.addEventHandler(this, "master_volume_change");
  button3 = new GButton(this, 230, 10, 80, 30);
  button3.setText("New Progression");
  button3.addEventHandler(this, "button3_click1");
  tempo = new GKnob(this, 20, 20, 60, 60, 0.8);
  tempo.setTurnRange(110, 70);
  tempo.setTurnMode(GKnob.CTRL_HORIZONTAL);
  tempo.setSensitivity(1);
  tempo.setShowArcOnly(false);
  tempo.setOverArcOnly(false);
  tempo.setIncludeOverBezel(false);
  tempo.setShowTrack(true);
  tempo.setLimits(80.0, 20.0, 160.0);
  tempo.setShowTicks(true);
  tempo.setOpaque(false);
  tempo.addEventHandler(this, "tempo_change");
  checkbox1 = new GCheckbox(this, 30, 210, 50, 20);
  checkbox1.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  checkbox1.setText("Mute");
  checkbox1.setOpaque(false);
  checkbox1.addEventHandler(this, "checkbox1_clicked1");
  checkbox2 = new GCheckbox(this, 110, 210, 60, 20);
  checkbox2.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  checkbox2.setText("Mute");
  checkbox2.setOpaque(false);
  checkbox2.addEventHandler(this, "checkbox2_clicked1");
  melody_pan = new GKnob(this, 20, 120, 60, 60, 0.8);
  melody_pan.setTurnRange(110, 70);
  melody_pan.setTurnMode(GKnob.CTRL_HORIZONTAL);
  melody_pan.setSensitivity(1);
  melody_pan.setShowArcOnly(false);
  melody_pan.setOverArcOnly(false);
  melody_pan.setIncludeOverBezel(false);
  melody_pan.setShowTrack(true);
  melody_pan.setLimits(0.5, 0.0, 1.0);
  melody_pan.setShowTicks(true);
  melody_pan.setOpaque(false);
  melody_pan.addEventHandler(this, "melody_pan_change");
  label1 = new GLabel(this, 10, 460, 80, 20);
  label1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label1.setText("Melody");
  label1.setOpaque(false);
  label2 = new GLabel(this, 90, 460, 80, 20);
  label2.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label2.setText("Chords");
  label2.setOpaque(false);
  label3 = new GLabel(this, 190, 460, 40, 20);
  label3.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label3.setText("Bass");
  label3.setOpaque(false);
  label4 = new GLabel(this, 250, 460, 80, 20);
  label4.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label4.setText("Drums");
  label4.setOpaque(false);
  label5 = new GLabel(this, 330, 460, 80, 20);
  label5.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label5.setText("Rain");
  label5.setOpaque(false);
  label6 = new GLabel(this, 410, 460, 80, 20);
  label6.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label6.setText("Vinyl");
  label6.setOpaque(false);
  label7 = new GLabel(this, 90, 80, 80, 20);
  label7.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label7.setText("Master");
  label7.setOpaque(false);
  label8 = new GLabel(this, 10, 80, 80, 20);
  label8.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label8.setText("Tempo");
  label8.setOpaque(false);
}

// Variable declarations 
// autogenerated do not edit
GSlider melody_volume; 
GSlider rhodes_volume; 
GSlider bass_volume; 
GSlider drums_volume; 
GSlider rain_volume; 
GSlider vinyl_volume; 
GButton start_button; 
GButton stop_button; 
GKnob master_volume; 
GButton button3; 
GKnob tempo; 
GCheckbox checkbox1; 
GCheckbox checkbox2; 
GKnob melody_pan; 
GLabel label1; 
GLabel label2; 
GLabel label3; 
GLabel label4; 
GLabel label5; 
GLabel label6; 
GLabel label7; 
GLabel label8; 
