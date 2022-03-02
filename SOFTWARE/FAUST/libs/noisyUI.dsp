//-----------------NOISY----------------//
//Filtered noise engine for hats, snares, lasers and bitcrushed percs
//--------------PARAMETERS:
//  1 - Pitch : Noise bandpass cutoff
//  2 - Pitch Amount : Bandpassed noise mix
//  3 - Pitch Tone : Noise bandpass resonance
//  4 - Pitch Mod Depth : Noise bandpass cutoff modulation amount
//  5 - Pitch Decay : Noise bandpass cutoff modulation envelope decay in seconds
//  6 - Resolution : Sparse noise average frequency of impulses per second
//  7 - TODO : Find one last interesting parameter !
//  8 - TODO : Find one last interesting parameter !

import("volenvUI.dsp");
import("stdfaust.lib");
import("utilities.lib");
import("noisy.lib");

process = hgroup("Noisy", noisy(pitch, pitchAmt, pitchTone,
                        pitchDepth, pitchDecay, resolution, trigger))<:_,_
with{
    trigger = button("T"):ba.impulsify;
    pitch = exp(vslider("[1]Pitch [style:knob]", log(200), log(20), log(20000), 0.01):si.smoo);
    pitchAmt = hslider("[2]Pitch Amount [style:knob]", 0.5, 0, 1, 0.001);
    pitchTone = vslider("[3]Pitch Tone[style:knob]", 1,1,10,0.01):si.smoo;
    pitchDepth = hslider("[4]Pitch Mod Depth[style:knob]", 20, 0, 10000, 0.01);
    pitchDecay = vslider("[5]Pitch Decay[style:knob]", 0.01, 0, 1, 0.01);
    resolution = exp(hslider("[9]Resolution [style:knob]", log(1000), log(200), log(20000), 0.001)
                                                            :si.smoo);
};
