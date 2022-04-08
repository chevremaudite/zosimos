//-----------------MIXER CHANNEL----------------//
// A voice's mixer channel.
//--------------PARAMETERS:
//  1 - Sample Level : the gain of the sample part
//  2 - Sample Pan : the panning of the sample part
//  1 - Engine Level : the gain of the engine part
//  2 - Engine Pan : the panning of the engine part

import("mixerchannel.lib");

mixerUI = hgroup("Mixer", mixer(smpLvl, smpPan, engLvl, engPan))
with{
    smpLvl = hslider("[1]Sample Level[style:knob]", 0, 0, 1, 0.001) : si.smoo;
    smpPan = hslider("[2]Sample Pan[style:knob]", 0, 0, 1, 0.001) : si.smoo;
    engLvl = hslider("[3]Engine Level[style:knob]", 0, 0, 1, 0.001) : si.smoo;
    engPan = hslider("[4]Engine Pan[style:knob]", 0, 0, 1, 0.001) : si.smoo;
};
