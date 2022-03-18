import("mixerchannel.lib");

mixerUI = hgroup("Mixer", mixer(smpLvl, smpPan, engLvl, engPan))
with{
    smpLvl = hslider("[1]Sample Level[style:knob]", 0, 0, 1, 0.001) : si.smoo;
    smpPan = hslider("[2]Sample Pan[style:knob]", 0, 0, 1, 0.001) : si.smoo;
    engLvl = hslider("[3]Engine Level[style:knob]", 0, 0, 1, 0.001) : si.smoo;
    engPan = hslider("[4]Engine Pan[style:knob]", 0, 0, 1, 0.001) : si.smoo;
};
