
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
import("dist.dsp");
import("filter.dsp");
import("utilities.dsp");

//NOTE : to smooth or not to smooth????
bitwise(trig) = hgroup("[1]Bitwise", ((compare >= maxOsc)-0.5) : * (trig:volEnv):drumSmooth)
with{
    compare = (osc1,osc2) <: &;
    maxOsc = max(osc1,osc2);
    osc1 = os.osc(freq1)*(1-clipping),os.pulsetrain(freq1, pmw)*clipping:+
    with{
        pmw = vslider("[8]Clipping PMW[style:knob]", 0.001, 0.001, 0.99, 0.001); 
        clipping = vslider("[7]Clipping[style:knob]", 0, 0, 1, 0.001); 
    };
    osc2 = os.osc(freq2);
    pitch = exp(vslider("[1]Pitch [style:knob]", log(420), log(20), log(2000), 0.01):si.smoo);
    freq1 = pitch+((trig):modEnvF1*modDepthF1)
    with{
        modDepthF1 = hslider("[2]Pitch Mod Depth [style:knob]", 2, 0, 2000, 0.01);
        modEnvF1 = en.are(a,d)
        with{
            a = 0;
            d = vslider("[3]Pitch Decay[style:knob]", 1, 0, 1, 0.01);  
        };
    }; 
    offset = exp(vslider("[4]Modulator Offset [style:knob]", 0, 0-log(2000), log(2000), 0.01):si.smoo);
    freq2 = pitch+offset+((trig):modEnvF2*modDepthF2)
    with{
        modDepthF2 = hslider("[5]Modulator Pitch Mod Depth [style:knob]", 2, 0, 2000, 0.01);
        modEnvF2 = en.are(a,d)
        with{
            a = 0;
            d = vslider("[6]Modulator Pitch Mod Decay[style:knob]", 1, 0, 1, 0.01);  
        };
    };
};

//Uncomment for standalone mode 
//process = bitwise(button("T"):ba.impulsify)<:_,_;