//-----------------ADDICTIVE----------------//
// Additive synthesis engine.
//--------------PARAMETERS:
//  1 - Pitch : Main pitch
//  2 - Fundamental Gain : Fundamental frequency's level
//  3 - Harmonics : Number of partials
//  4 - Interval : Partial interval from main pitch and to each other
//  5 - Offset : Nth partial offset from n*f
//  6 - Oddness : Odd partials strength
//  7 - High Gain : Higher partials gain
//  8 - Harmonics Decay : Harmonics exponential envelope decay


import("stdfaust.lib");
import("addictive.lib");


process = hgroup("Addictive", add(pitch, fGain,
                                harms, interval, offset,
                                oddness, highGain, harmDecay,
                                trigger)) <: (_,_)
with {
    trigger = button("T"):ba.impulsify;
    pitch = exp(vslider("[1]Pitch [style:knob]", log(420), log(100), log(4200), 0.01) : si.smoo);
    fGain = vslider("[2]Fundamental Level[style:knob]", 0.01, 0, 1, 0.01);
    harms = hslider("[3]Harmonics [style:knob]", 0, 0, 32, 1) : si.smoo;
    interval = vslider("[4]Interval [style:knob]", 0, 0, 1000, 0.001) : si.smoo;
    offset = vslider("[5]Offset [style:knob]", 10, 0, 100, 0.001) : si.smoo;
    oddness = hslider("[6]Oddness [style:knob]", 0, 0, 1, 0.001) : si.smoo;
    highGain = vslider("[7]High Gain[style:knob]", 0.01, 0.01, 0.999, 0.0001);
    harmDecay = vslider("[8]Harmonics Decay[style:knob]", 0.01, 0, 1, 0.01);
};
