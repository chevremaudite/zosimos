import("filter.dsp");
import("volenv.dsp");

hh=hgroup("[0]Noisy High Hat", no.pink_noise*(trig:volEnv*10)<:(filtered*dry*10,trig*(1-dry)):+)
with{
    filtered=fi.bandpass(1,pitch+pitchdepth*(trig:pitchenv),pitch+pitchdepth*(trig:pitchenv)+50);
    pitch = vslider("[1]Pitch [style:knob]", 200, 20, 20000, 0.01):si.smoo;
    pitchenv = en.ar(a,d)
    with{
        a = 0;
        d = vslider("[2]Pitch Decay[style:knob]", 0.01, 0, 0.2, 0.01);
    };
    dry = hslider("[2]Pitch Amount [style:knob]", 0.5, 0, 1, 0.001);
    pitchdepth = hslider("[3]Pitch Mod Depth[style:knob]", 20, 0, 10000, 0.01);    
    trig = button("[8]trig");
    vol=vslider("[9]Level[style:knob]", 0.5, 0,1,0.01):si.smoo;
};