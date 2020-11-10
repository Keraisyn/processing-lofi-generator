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
    if (!melody_mute.isSelected()) {
        m.changeVolume(1.0-melody_volume.getValueF());
    }
} //_CODE_:melody_volume:706844:

public void rhodes_volume_change(GSlider source, GEvent event) { //_CODE_:rhodes_volume:361035:
    println("slider1 - GSlider >> GEvent." + event + " @ " + millis());
    if (!rhodes_mute.isSelected()) {
        r.changeVolume(1.0-rhodes_volume.getValueF());
    }
} //_CODE_:rhodes_volume:361035:

public void bass_volume_change(GSlider source, GEvent event) { //_CODE_:bass_volume:878821:
    println("slider2 - GSlider >> GEvent." + event + " @ " + millis());
    if (!bass_mute.isSelected()) {
        b.changeVolume(1.0-bass_volume.getValueF());
    }
} //_CODE_:bass_volume:878821:

public void drums_volume_change(GSlider source, GEvent event) { //_CODE_:drums_volume:526970:
    println("slider3 - GSlider >> GEvent." + event + " @ " + millis());
    if (!drums_mute.isSelected()) {
        d.changeVolume(1.0-drums_volume.getValueF());
    }
} //_CODE_:drums_volume:526970:

public void rain_volume_change(GSlider source, GEvent event) { //_CODE_:rain_volume:988954:
    println("slider4 - GSlider >> GEvent." + event + " @ " + millis());
    if (!rain_mute.isSelected()) {
        ra.changeVolume(1.0-rain_volume.getValueF());
    }
} //_CODE_:rain_volume:988954:

public void vinyl_volume_change(GSlider source, GEvent event) { //_CODE_:vinyl_volume:922849:
    println("slider5 - GSlider >> GEvent." + event + " @ " + millis());
    if (!vinyl_mute.isSelected()) {
        v.changeVolume(1.0-vinyl_volume.getValueF());
    }
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

public void new_progression_button_click(GButton source, GEvent event) { //_CODE_:new_progression_button:258491:
    println("button3 - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:new_progression_button:258491:

public void tempo_change(GKnob source, GEvent event) { //_CODE_:tempo:606296:
    println("tempo - GKnob >> GEvent." + event + " @ " + millis());
    int fr = int(tempo.getValueF()/60*beatDivision);
    println(fr);
    frameRate(fr);
} //_CODE_:tempo:606296:

public void melody_mute_change(GCheckbox source, GEvent event) { //_CODE_:melody_mute:615215:
    println("checkbox1 - GCheckbox >> GEvent." + event + " @ " + millis());
    if (melody_mute.isSelected()) {
        m.changeVolume(0);
    } else {
        m.changeVolume(1.0-melody_volume.getValueF());
    }
} //_CODE_:melody_mute:615215:

public void rhodes_mute_change(GCheckbox source, GEvent event) { //_CODE_:rhodes_mute:730507:
    println("checkbox2 - GCheckbox >> GEvent." + event + " @ " + millis());
    if (rhodes_mute.isSelected()) {
        r.changeVolume(0);
    } else {
        r.changeVolume(1.0-rhodes_volume.getValueF());
    }
} //_CODE_:rhodes_mute:730507:

public void melody_pan_change(GKnob source, GEvent event) { //_CODE_:melody_pan:247310:
    println("melody_pan - GKnob >> GEvent." + event + " @ " + millis());
    m.changePan(melody_pan.getValueF());
} //_CODE_:melody_pan:247310:

public void rhodes_pan_change(GKnob source, GEvent event) { //_CODE_:rhodes_pan:200923:
    println("rhodes_pan - GKnob >> GEvent." + event + " @ " + millis());
    r.changePan(rhodes_pan.getValueF());
} //_CODE_:rhodes_pan:200923:

public void bass_pan_change(GKnob source, GEvent event) { //_CODE_:bass_pan:287028:
    println("bass_pan - GKnob >> GEvent." + event + " @ " + millis());
    b.changePan(bass_pan.getValueF());
} //_CODE_:bass_pan:287028:

public void drums_pan_change(GKnob source, GEvent event) { //_CODE_:drums_pan:278885:
    println("drums_pan - GKnob >> GEvent." + event + " @ " + millis());
    d.changePan(drums_pan.getValueF());
} //_CODE_:drums_pan:278885:

public void rain_pan_change(GKnob source, GEvent event) { //_CODE_:rain_pan:950732:
    println("rain_pan - GKnob >> GEvent." + event + " @ " + millis());
    ra.changePan(rain_pan.getValueF());
} //_CODE_:rain_pan:950732:

public void vinyl_pan_change(GKnob source, GEvent event) { //_CODE_:vinyl_pan:938734:
    println("vinyl_pan - GKnob >> GEvent." + event + " @ " + millis());
    v.changePan(vinyl_pan.getValueF());
} //_CODE_:vinyl_pan:938734:

public void bass_mute_change(GCheckbox source, GEvent event) { //_CODE_:bass_mute:571626:
    println("bass_mute - GCheckbox >> GEvent." + event + " @ " + millis());
    if (bass_mute.isSelected()) {
        b.changeVolume(0);
    } else {
        b.changeVolume(1.0-bass_volume.getValueF());
    }
} //_CODE_:bass_mute:571626:

public void drums_mute_change(GCheckbox source, GEvent event) { //_CODE_:drums_mute:378757:
    println("drums_mute - GCheckbox >> GEvent." + event + " @ " + millis());
    if (drums_mute.isSelected()) {
        d.changeVolume(0);
    } else {
        d.changeVolume(1.0-drums_volume.getValueF());
    }
} //_CODE_:drums_mute:378757:

public void rain_mute_change(GCheckbox source, GEvent event) { //_CODE_:rain_mute:769988:
    println("rain_mute - GCheckbox >> GEvent." + event + " @ " + millis());
    if (rain_mute.isSelected()) {
        r.changeVolume(0);
    } else {
        r.changeVolume(1.0-rain_volume.getValueF());
    }
} //_CODE_:rain_mute:769988:

public void vinyl_mute_change(GCheckbox source, GEvent event) { //_CODE_:vinyl_mute:808025:
    println("vinyl_mute - GCheckbox >> GEvent." + event + " @ " + millis());
    if (vinyl_mute.isSelected()) {
        v.changeVolume(0);
    } else {
        v.changeVolume(1.0-vinyl_volume.getValueF());
    }
} //_CODE_:vinyl_mute:808025:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI() {
    G4P.messagesEnabled(false);
    G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
    G4P.setMouseOverEnabled(false);
    surface.setTitle("Sketch Window");
    melody_volume = new GSlider(this, 70, 250, 200, 40, 10.0);
    melody_volume.setRotation(PI/2, GControlMode.CORNER);
    melody_volume.setLimits(0.5, 0.0, 1.0);
    melody_volume.setNumberFormat(G4P.DECIMAL, 2);
    melody_volume.setLocalColorScheme(GCScheme.CYAN_SCHEME);
    melody_volume.setOpaque(false);
    melody_volume.addEventHandler(this, "melody_volume_change");
    rhodes_volume = new GSlider(this, 150, 250, 200, 40, 10.0);
    rhodes_volume.setRotation(PI/2, GControlMode.CORNER);
    rhodes_volume.setLimits(0.5, 0.0, 1.0);
    rhodes_volume.setNumberFormat(G4P.DECIMAL, 2);
    rhodes_volume.setLocalColorScheme(GCScheme.CYAN_SCHEME);
    rhodes_volume.setOpaque(false);
    rhodes_volume.addEventHandler(this, "rhodes_volume_change");
    bass_volume = new GSlider(this, 230, 250, 200, 40, 10.0);
    bass_volume.setRotation(PI/2, GControlMode.CORNER);
    bass_volume.setLimits(0.5, 0.0, 1.0);
    bass_volume.setNumberFormat(G4P.DECIMAL, 2);
    bass_volume.setLocalColorScheme(GCScheme.CYAN_SCHEME);
    bass_volume.setOpaque(false);
    bass_volume.addEventHandler(this, "bass_volume_change");
    drums_volume = new GSlider(this, 310, 250, 200, 40, 10.0);
    drums_volume.setRotation(PI/2, GControlMode.CORNER);
    drums_volume.setLimits(0.0, 0.0, 1.0);
    drums_volume.setNumberFormat(G4P.DECIMAL, 2);
    drums_volume.setLocalColorScheme(GCScheme.CYAN_SCHEME);
    drums_volume.setOpaque(false);
    drums_volume.addEventHandler(this, "drums_volume_change");
    rain_volume = new GSlider(this, 390, 250, 200, 40, 10.0);
    rain_volume.setRotation(PI/2, GControlMode.CORNER);
    rain_volume.setLimits(0.5, 0.0, 1.0);
    rain_volume.setNumberFormat(G4P.DECIMAL, 2);
    rain_volume.setLocalColorScheme(GCScheme.CYAN_SCHEME);
    rain_volume.setOpaque(false);
    rain_volume.addEventHandler(this, "rain_volume_change");
    vinyl_volume = new GSlider(this, 470, 250, 200, 40, 10.0);
    vinyl_volume.setRotation(PI/2, GControlMode.CORNER);
    vinyl_volume.setLimits(0.3, 0.0, 1.0);
    vinyl_volume.setNumberFormat(G4P.DECIMAL, 2);
    vinyl_volume.setLocalColorScheme(GCScheme.CYAN_SCHEME);
    vinyl_volume.setOpaque(false);
    vinyl_volume.addEventHandler(this, "vinyl_volume_change");
    start_button = new GButton(this, 400, 10, 80, 30);
    start_button.setText("Start");
    start_button.setLocalColorScheme(GCScheme.GREEN_SCHEME);
    start_button.addEventHandler(this, "start_button_click");
    stop_button = new GButton(this, 400, 60, 80, 30);
    stop_button.setText("Stop");
    stop_button.setLocalColorScheme(GCScheme.RED_SCHEME);
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
    master_volume.setLocalColorScheme(GCScheme.GOLD_SCHEME);
    master_volume.setOpaque(false);
    master_volume.addEventHandler(this, "master_volume_change");
    new_progression_button = new GButton(this, 290, 60, 80, 30);
    new_progression_button.setText("New Progression");
    new_progression_button.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
    new_progression_button.addEventHandler(this, "new_progression_button_click");
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
    tempo.setLocalColorScheme(GCScheme.GOLD_SCHEME);
    tempo.setOpaque(false);
    tempo.addEventHandler(this, "tempo_change");
    melody_mute = new GCheckbox(this, 30, 210, 50, 20);
    melody_mute.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
    melody_mute.setText("Mute");
    melody_mute.setOpaque(false);
    melody_mute.addEventHandler(this, "melody_mute_change");
    rhodes_mute = new GCheckbox(this, 110, 210, 60, 20);
    rhodes_mute.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
    rhodes_mute.setText("Mute");
    rhodes_mute.setOpaque(false);
    rhodes_mute.addEventHandler(this, "rhodes_mute_change");
    melody_pan = new GKnob(this, 20, 120, 60, 60, 0.8);
    melody_pan.setTurnRange(110, 70);
    melody_pan.setTurnMode(GKnob.CTRL_HORIZONTAL);
    melody_pan.setSensitivity(1);
    melody_pan.setShowArcOnly(false);
    melody_pan.setOverArcOnly(false);
    melody_pan.setIncludeOverBezel(false);
    melody_pan.setShowTrack(true);
    melody_pan.setLimits(0.0, -1.0, 1.0);
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
    rhodes_pan = new GKnob(this, 100, 120, 60, 60, 0.8);
    rhodes_pan.setTurnRange(110, 70);
    rhodes_pan.setTurnMode(GKnob.CTRL_HORIZONTAL);
    rhodes_pan.setSensitivity(1);
    rhodes_pan.setShowArcOnly(false);
    rhodes_pan.setOverArcOnly(false);
    rhodes_pan.setIncludeOverBezel(false);
    rhodes_pan.setShowTrack(true);
    rhodes_pan.setLimits(0.0, -1.0, 1.0);
    rhodes_pan.setShowTicks(true);
    rhodes_pan.setOpaque(false);
    rhodes_pan.addEventHandler(this, "rhodes_pan_change");
    bass_pan = new GKnob(this, 180, 120, 60, 60, 0.8);
    bass_pan.setTurnRange(110, 70);
    bass_pan.setTurnMode(GKnob.CTRL_HORIZONTAL);
    bass_pan.setSensitivity(1);
    bass_pan.setShowArcOnly(false);
    bass_pan.setOverArcOnly(false);
    bass_pan.setIncludeOverBezel(false);
    bass_pan.setShowTrack(true);
    bass_pan.setLimits(0.0, -1.0, 1.0);
    bass_pan.setShowTicks(true);
    bass_pan.setOpaque(false);
    bass_pan.addEventHandler(this, "bass_pan_change");
    drums_pan = new GKnob(this, 260, 120, 60, 60, 0.8);
    drums_pan.setTurnRange(110, 70);
    drums_pan.setTurnMode(GKnob.CTRL_HORIZONTAL);
    drums_pan.setSensitivity(1);
    drums_pan.setShowArcOnly(false);
    drums_pan.setOverArcOnly(false);
    drums_pan.setIncludeOverBezel(false);
    drums_pan.setShowTrack(true);
    drums_pan.setLimits(0.0, -1.0, 1.0);
    drums_pan.setShowTicks(true);
    drums_pan.setOpaque(false);
    drums_pan.addEventHandler(this, "drums_pan_change");
    rain_pan = new GKnob(this, 340, 120, 60, 60, 0.8);
    rain_pan.setTurnRange(110, 70);
    rain_pan.setTurnMode(GKnob.CTRL_HORIZONTAL);
    rain_pan.setSensitivity(1);
    rain_pan.setShowArcOnly(false);
    rain_pan.setOverArcOnly(false);
    rain_pan.setIncludeOverBezel(false);
    rain_pan.setShowTrack(true);
    rain_pan.setLimits(0.0, -1.0, 1.0);
    rain_pan.setShowTicks(true);
    rain_pan.setOpaque(false);
    rain_pan.addEventHandler(this, "rain_pan_change");
    vinyl_pan = new GKnob(this, 420, 120, 60, 60, 0.8);
    vinyl_pan.setTurnRange(110, 70);
    vinyl_pan.setTurnMode(GKnob.CTRL_HORIZONTAL);
    vinyl_pan.setSensitivity(1);
    vinyl_pan.setShowArcOnly(false);
    vinyl_pan.setOverArcOnly(false);
    vinyl_pan.setIncludeOverBezel(false);
    vinyl_pan.setShowTrack(true);
    vinyl_pan.setLimits(0.0, -1.0, 1.0);
    vinyl_pan.setShowTicks(true);
    vinyl_pan.setOpaque(false);
    vinyl_pan.addEventHandler(this, "vinyl_pan_change");
    bass_mute = new GCheckbox(this, 190, 210, 60, 20);
    bass_mute.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
    bass_mute.setText("Mute");
    bass_mute.setOpaque(false);
    bass_mute.addEventHandler(this, "bass_mute_change");
    drums_mute = new GCheckbox(this, 270, 210, 50, 20);
    drums_mute.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
    drums_mute.setText("Mute");
    drums_mute.setOpaque(false);
    drums_mute.addEventHandler(this, "drums_mute_change");
    rain_mute = new GCheckbox(this, 350, 210, 50, 20);
    rain_mute.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
    rain_mute.setText("Mute");
    rain_mute.setOpaque(false);
    rain_mute.addEventHandler(this, "rain_mute_change");
    vinyl_mute = new GCheckbox(this, 430, 210, 60, 20);
    vinyl_mute.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
    vinyl_mute.setText("Mute");
    vinyl_mute.setOpaque(false);
    vinyl_mute.addEventHandler(this, "vinyl_mute_change");
    label9 = new GLabel(this, 210, 20, 130, 30);
    label9.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    label9.setText("mm lofi mixer v2 special edition");
    label9.setOpaque(false);
    label10 = new GLabel(this, 10, 180, 80, 20);
    label10.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    label10.setText("Pan");
    label10.setOpaque(false);
    label11 = new GLabel(this, 90, 180, 80, 20);
    label11.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    label11.setText("Pan");
    label11.setOpaque(false);
    label12 = new GLabel(this, 170, 180, 80, 20);
    label12.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    label12.setText("Pan");
    label12.setOpaque(false);
    label13 = new GLabel(this, 250, 180, 80, 20);
    label13.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    label13.setText("Pan");
    label13.setOpaque(false);
    label14 = new GLabel(this, 330, 180, 80, 20);
    label14.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    label14.setText("Pan");
    label14.setOpaque(false);
    label15 = new GLabel(this, 410, 180, 80, 20);
    label15.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    label15.setText("Pan");
    label15.setOpaque(false);
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
GButton new_progression_button; 
GKnob tempo; 
GCheckbox melody_mute; 
GCheckbox rhodes_mute; 
GKnob melody_pan; 
GLabel label1; 
GLabel label2; 
GLabel label3; 
GLabel label4; 
GLabel label5; 
GLabel label6; 
GLabel label7; 
GLabel label8; 
GKnob rhodes_pan; 
GKnob bass_pan; 
GKnob drums_pan; 
GKnob rain_pan; 
GKnob vinyl_pan; 
GCheckbox bass_mute; 
GCheckbox drums_mute; 
GCheckbox rain_mute; 
GCheckbox vinyl_mute; 
GLabel label9; 
GLabel label10; 
GLabel label11; 
GLabel label12; 
GLabel label13; 
GLabel label14; 
GLabel label15; 
