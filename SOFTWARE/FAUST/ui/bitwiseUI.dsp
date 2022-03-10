//-----------------BITWISE----------------//
//Bitwise operations based engine for hard kicks and digital weird percs
//--------------PARAMETERS:
//  1 - Pitch : Main osc pitch
//  2 - Pitch Mod Depth : Main osc pitch modulation amount
//  3 - Pitch Decay : Main osc pitch modulation exponential envelope decay in seconds
//  4 - Modulator Offset : Modulator osc offset from main pitch
//  5 - Modulator Pitch Mod Depth : Modulator osc pitch modulation amount
//  6 - Modulator Pitch Mod Decay : Modulator osc pitch modulation exponential envelope decay in seconds
//  7 - PMW1 : Main osc square wave PMW
//  8 - PMW2 : Modulator osc offset

import("stdfaust.lib");
import("volenvUI.dsp");
import("utilities.lib");
import("bitwise.lib");

process = hgroup("Bitwise", bitwise(pitch, pitchDepth, pitchDecay,
                                    offset, offsetDepth, offsetDecay,
                                    pwm1, pwm2, trigger)*2) <:_,_
with{
  trigger = button("T"):ba.impulsify;
  pitch = exp(vslider("[1]Pitch [style:knob]", log(420), log(20), log(2000), 0.01)
          :si.smoo);
  pitchDepth = hslider("[2]Pitch Mod Depth [style:knob]", 2, 0, 2000, 0.01);
  pitchDecay = vslider("[3]Pitch Decay[style:knob]", 1, 0, 1, 0.01);
  pwm1 = vslider("[4]PWM 1[style:knob]", 0.1, 0.1, 0.90, 0.001);
  offset = exp(vslider("[5]Modulator Offset [style:knob]", 0, 0, log(10000), 0.01)
          :si.smoo);
  offsetDepth = hslider("[6]Modulator Pitch Mod Depth [style:knob]", 2, 0, 2000, 0.01);
  offsetDecay = vslider("[7]Modulator Pitch Mod Decay[style:knob]", 1, 0, 1, 0.01);
  pwm2 = vslider("[8]PWM 2[style:knob]", 0.1, 0.1, 0.90, 0.001);
};
