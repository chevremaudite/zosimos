import("filter.dsp");
import("volenv.dsp");

bb93 = hgroup("[0]93 Bang Bang", (carrier*(_:volEnv)):dist)
with{
    pitchenv = en.ar(a,d)
    with{
    a = 0;
    d = vslider("[3]Pitch Decay[style:knob]", 0.01, 0, 0.2, 0.01);
    };
    carrier = os.osc(pitch+pitchdepth*(_:pitchenv));
    pitch = vslider("[1]Pitch [style:knob]", 50, 20, 200, 0.01):si.smoo;
    pitchdepth = hslider("[2]Pitch Mod Depth [style:knob]", 20, 0, 500, 0.01);
    dist = ef.cubicnl(drive,0)
    with{
        drive=hslider("[4]Drive [style:knob]", 0, 0, 1, 0.001):si.smoo;
    };
    kTrig = button("[8]trig");
};