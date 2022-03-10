//-----------------93 BANG BANG----------------//
//Classic Virtual analog kick and tom generator
//--------------PARAMETERS:
//  1 - Pitch : Main osc pitch
//  2 - Pitch Mod Depth : Main osc pitch modulation amount
//  3 - Pitch Decay : Main osc pitch modulation envelope decay in seconds
//  4 - Noise Amount : Noise transient volume
//  5 - Noise Pitch : Noise transient's bandpass frequency
//  6 - Noise Decay : Noise transient envelope decay in seconds
//  7 - Wave : Main osc waveform going from sine to tri to square with crossfade
//  8 - ????

import("stdfaust.lib");
import("93bangbang.lib");

process = hgroup("93 Bang Bang", bb93(pitch, pitchDepth, pitchDecay,
                                    noiseAmt, noisePitch, noiseDecay,
                                    waveS, trigger)
                                    <: (_,_))
with {
    trigger = button("T"):ba.impulsify;
    pitch = exp(vslider("[1]Pitch [style:knob]", log(50), log(20), log(500), 0.01) : si.smoo);
    pitchDepth = hslider("[2]Pitch Mod Depth [style:knob]", 20, 0, 500, 0.01) : si.smoo;
    pitchDecay = vslider("[3]Pitch Decay[style:knob]", 0.01, 0, 0.5, 0.01);
    noiseAmt = hslider("[4]Noise Amount[style:knob]", 0, 0, 5, 0.001) : si.smoo;
    noisePitch = exp(vslider("[5]Noise Pitch [style:knob]", log(200), log(100), log(4200), 0.01) : si.smoo);
    noiseDecay = vslider("[6]Noise Decay[style:knob]", 0.01, 0, 0.5, 0.01);
    waveS = hslider("[7]Wave [style:knob]", 0, 0, ma.PI/2, 0.001) : si.smoo;
};
