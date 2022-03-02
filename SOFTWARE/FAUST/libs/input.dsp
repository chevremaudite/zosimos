import("stdfaust.lib");
import("volenv.dsp");
input(trig) = hgroup("[1]Input", (_*gain) * (trig:volEnv) :> _)
with{
    gain = hslider("[9]Gain[style:knob]", 0.5, 0 , 1 , 0.01):si.smoo;
};
