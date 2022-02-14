//-----------------BITWISE----------------//
//Bitwise operations based engine for hard kicks and digital weird percs
//PARAMETERS:
//  1 - Pitch : Main osc pitch
//  2 - Pitch Mod Depth : Main osc pitch modulation amount
//  3 - Pitch Decay : Main osc pitch modulation exponential envelope decay in seconds
//  4 - Modulator Offset : Modulator osc offset from main pitch
//  5 - Modulator Pitch Mod Depth : Modulator osc pitch modulation amount
//  6 - Modulator Pitch Mod Decay : Modulator osc pitch modulation exponential envelope decay in seconds
//  7 - Clipping : Main osc square wave mix
//  8 - Clipping PMW : Main osc square wave PMW

import("stdfaust.lib");
import("volenv.dsp");
import("utilities.dsp");
import("bitwise.lib");

process = hgroup("Bitwise", bitwise(pitch, pitchDepth, pitchDecay,
                                    offset, offsetDepth, offsetDecay,
                                    clipping, pwm, trigger):drumSmooth)<:_,_
with{
  trigger = button("T"):ba.impulsify;
  pitch = exp(vslider("[1]Pitch [style:knob]", log(420), log(20), log(2000), 0.01)
          :si.smoo);
  pitchDepth = hslider("[2]Pitch Mod Depth [style:knob]", 2, 0, 2000, 0.01);
  pitchDecay = vslider("[3]Pitch Decay[style:knob]", 1, 0, 1, 0.01);
  offset = exp(vslider("[4]Modulator Offset [style:knob]", 0, 0-log(2000), log(2000), 0.01)
          :si.smoo);
  offsetDepth = hslider("[5]Modulator Pitch Mod Depth [style:knob]", 2, 0, 2000, 0.01);
  offsetDecay = vslider("[6]Modulator Pitch Mod Decay[style:knob]", 1, 0, 1, 0.01);
  clipping = vslider("[7]Clipping[style:knob]", 0, 0, 1, 0.001);
  pwm = vslider("[8]Clipping PWM[style:knob]", 0.001, 0.001, 0.99, 0.001);
};
