//Modulation source page.
//--------------PARAMETERS:
//  1 - Mode : Modulation mode (0-free, 1-sync, 2-reset, 3-envelope)
/*BUG : currently only free  and reset modes work*/
//  2 - Polarity : The LFO's polarity (0-Unipolar[0-1], 1-Bipolar[-1,1])
//  3 - Shape : Mod carrier's waveform (0-sine, 1-tri, 2-saw, 3-square, 4-random)
//  4 - Rate : Mod carrier's rate
//  5 - Depth : Mod carrier's amplitude
//  6 - destVoice : The voice of destination
//  7 - destParam : The parameter of destination inside the chosen voice

import("modsource.lib");

process = hgroup("Modulation source", modsource(rate, depth, shape,
                                                mode, pol,
                                                destVoice, destParam, trigger))
with{
    trigger = button("T"):ba.impulsify;
    mode = hslider("[0]Mode [style:menu{'Free':0;'Sync':1;'Reset':2;'Envelope':3}]", 0, 0, 3, 1);
    pol = hslider("[0]Polarity [style:menu{'Unipolar':0;'Bipolar':1}]", 0, 0, 1, 1);
    shape = hslider("[1]Shape [style:menu{'Sine':0;'Tri':1;'Saw':2;'Square':3;'Random':4}]", 0, 0, 4, 1);
    rate = hslider("[2]Rate [style:knob]", 1, 0.01, 20, 0.001) : si.smoo;
    depth = hslider("[3]Depth [style:knob]", 0, 0, 1, 0.001) : si.smoo;
    destVoice = hslider("[5]Destination Voice[style:knob]", 1, 1, 8, 1);
    destParam = hslider("[6]Destination Parameter[style:knob]", 1, 1, 8, 1);
};
