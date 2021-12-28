import("filter.dsp");
mdd = hgroup("[0]Modal Drums", blower:modals)
with{
    trigMD = button("V");
    blower = pm.blower(strength*(trigMD:volEnv),(trigMD:volEnv)*0.5,noiseAmount)
    with{
        strength = vslider("[1]Strength[style:knob]", 0.5, 0, 1, 0.01):si.smoo;
        noiseAmount = vslider("[2]Noise Amount[style:knob]", 200, 20, 4200, 0.01):si.smoo;
    };
    modals = pm.djembeModel(pitch)*2
    with{
        pitch = vslider("[1]Pitch [style:knob]", 200, 20, 20000, 0.01):si.smoo;
    };
    vol=vslider("[9]Level[style:knob]", 0.5, 0,1,0.01):si.smoo;
};