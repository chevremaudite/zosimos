import("stdfaust.lib");
import ("volenv.dsp");
import("utilities.dsp");

fm(trig) = hgroup("[1]FM", (carrier)*(trig:volEnv))
with {
    pitch = exp(vslider("[1]Pitch [style:knob]", log(420), log(50), log(4200), 0.01):si.smoo);
    carrier = os.osc(pitch+modulator);
    modulator = os.osc(pitch * ratio)*modDepth*(trig:modEnv)
    with{
        ratio = vslider("[3]Mod Ratio [style:knob]", 5, 0, 10, 0.01):si.smoo;
        modDepth = hslider("[2]Mod Depth [style:knob]", 2, 0, 2000, 0.01);
        modEnv = en.ar(a,d);
        a = 0;
        d = vslider("[4]Mod Decay[style:knob]", 1, 0, 1, 0.01);
    };
};

process = fm(button("T"):ba.impulsify)<:_,_;
