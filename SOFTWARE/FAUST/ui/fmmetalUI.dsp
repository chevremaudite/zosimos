//-----------------FM METAL----------------//
//FM engine tailored to produce metallic percussions such as bells, hats or distorted snares
//--------------PARAMETERS:
//  1 - Pitch : Carrier's pitch
//  2 - Mod Amount : Carrier's modulation amount
//  3 - Ratio 1 : First modulator's frequency to carrier's frequency ratio
//  4 - Ratio 2 : Second modulator's frequency to carrier's frequency ratio
//  5 - Ratio 3 : Third modulator's frequency to carrier's frequency ratio
//  6 - Feedback : First modulator's FM feedback
//  7 - Mod Attack : Carrier's modulation envelope linear attack
//  8 - Mod Decay : Carrier's modulation envelope linear decay

import("volenvUI.dsp");
import("stdfaust.lib");
import("utilities.lib");
import("fmmetal.lib");

process = hgroup("FM Metal", fmmetal(pitch, modAmt, r1, r2, r3, fb,
                                                    modAtk, modDec,
                                                    trigger)) <: (_,_)
with{
    trigger = button("T"):ba.impulsify;
    pitch = exp(vslider("[1]Pitch [style:knob]", log(200), log(20), log(20000), 0.01):si.smoo);
    modAmt = hslider("[2]Mod Amount[style:knob]", 0.01, 0, 1, 0.01);
    r1 = hslider("[3]Ratio 1 [style:knob]", 1, 0.5, 15, 0.001);
    r2 = vslider("[4]Ratio 2 [style:knob]", 1, 0.5, 15, 0.001):si.smoo;
    r3 = hslider("[5]Ratio 3 [style:knob]", 1, 0.5, 15, 0.001);
    fb = hslider("[6]Feedback [style:knob]", 0, 0, 1, 0.001);
    modAtk = hslider("[7]Mod Attack[style:knob]", 0.01, 0, 1, 0.01);
    modDec = hslider("[8]Mod Decay[style:knob]", 0.01, 0, 1, 0.01);
};
