//-----------------MOD SOURCE----------------//
//Modulation source page.
//--------------PARAMETERS:
//  1 - Rate : Mod carrier's rate
//  2 - Depth : Mod carrier's amplitude
//  3 - Shape : Mod carrier's waveform (1-sine, 2-tri, 3-saw, 4-square, 5-random)
//  4 - Mode : Modulation mode (1-free, 2-sync, 3-reset, 4-envelope)
/*BUG : currently only free mode works*/
//  5 - destVoice : The voice of destination
//  6 - destParam : The parameter of destination inside the chosen voice

import("modsource.lib");

process = hgroup("Modulation source", modsource(rate, depth, shape, mode, destVoice, destParam, trigger))
with{
    trigger = button("T"):ba.impulsify;
    shape = hslider("[1]Shape [style:menu{'Sine':0;'Tri':1;'Saw':2;'Square':3;'Random':4}]", 0, 0, 4, 1);
    rate = hslider("[2]Rate [style:knob]", 1, 0.01, 20, 0.001) : si.smoo;
    depth = hslider("[3]Depth [style:knob]", 0, 0, 1, 0.001) : si.smoo;
    mode = hslider("[4]Mode [style:menu{'Free':0;'Sync':1;'Reset':2;'Envelope':3}]", 0, 0, 3, 1);
    destVoice = hslider("[5]Destination Voice[style:knob]", 1, 1, 8, 1);
    destParam = hslider("[6]Destination Parameter[style:knob]", 1, 1, 8, 1);
};
