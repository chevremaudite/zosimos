dist = hgroup("[7]Distortion", _<: _*(1-distMix), ef.cubicnl_nodc(drive, offset)*distMix : +)
    with{
        distMix = hslider("[4]Distortion Mix [style:knob]", 0, 0, 1, 0.001):si.smoo;
        drive=hslider("[5]Drive [style:knob]", 0, 0, 1, 0.001):si.smoo;
        offset = hslider("[6]Offset [style:knob]", 0, 0, 1, 0.001):si.smoo;
    };