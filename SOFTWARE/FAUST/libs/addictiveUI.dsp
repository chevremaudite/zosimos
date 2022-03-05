//-----------------ADDICTIVE----------------//
//Classic Virtual analog kick and tom generator
//--------------PARAMETERS:
//  1 - Pitch : Main osc pitch
//  2 - Interval : Partial interval from main pitch and to each other
//  3 - Oddness : Odd partials strength
//  4 - Harms : Partial number
//  5 - ????
//  6 - ????
//  7 - ????
//  8 - ????

import("stdfaust.lib");
import("addictive.lib");

ut = library("utilities.dsp");

process = hgroup("Addictive", add(pitch, harms, interval, oddness, offset, trigger)) <: (_,_)
with {
    trigger = button("T"):ba.impulsify;
    pitch = exp(vslider("[1]Pitch [style:knob]", log(420), log(100), log(4200), 0.01) : si.smoo);
    harms = hslider("[2]Harmonics [style:knob]", 20, 0, 500, 1) : si.smoo;
    interval = vslider("[3]Interval [style:knob]", 0, 0, 1, 0.001) : si.smoo;
    oddness = hslider("[4]Oddness [style:knob]", 0, 0, 1, 0.001) : si.smoo;
    offset = vslider("[5]Offset [style:knob]", 10, -50, 50, 0.001) : si.smoo;
};
