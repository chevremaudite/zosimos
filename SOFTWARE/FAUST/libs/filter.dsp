

import("stdfaust.lib");
filterUI = hgroup("[8]Filter", _ <: (_ * (1-fMix)), (lp,hp,bp:select3(filterType) * fMix) : +)
with{ 
    filterType = hslider("[0]Filter Type[style:menu{'LP':0;'HP':1;'BP':2}]", 0, 0,2,1);
    lp = fi.resonlp(cutoff, q, 1);
    cutoff = exp(vslider("[1]Cutoff[style:knob]", log(10000),log(1),log((48000/2)-2000),0.01):si.smoo);
    q = vslider("[2]Resonance[style:knob]", 1,1,10,0.01):si.smoo;
    fMix = hslider("[4]Filter Mix [style:knob]", 0, 0, 1, 0.001):si.smoo;
    hp = fi.resonhp(cutoff, q, 1);
    bp = fi.resonbp(cutoff, q,1);
};
