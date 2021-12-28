import("stdfaust.lib");
filterUI = hgroup("[8]Filter", dist<:lp,hp,bp:select3(filterType)) 
with{ 
    filterType = hslider("Filter Type[style:menu{'LP':0;'HP':1;'BP':2}]", 0, 0,2,1);
    lp = fi.resonlp(cutoff, q, 1);
    cutoff = exp(vslider("Cutoff[style:knob]", log(10000),log(1),log((48000/2)-2000),0.01):si.smoo);
    q = vslider("Resonance[style:knob]", 1,1,20,0.01):si.smoo;
    hp = fi.resonbp(cutoff, q, 1);
    bp = fi.resonbp(cutoff, q,1);
};
dist = (_*drive) : max(-1) : min(1)
    with{
        drive=hslider("[4]Drive [style:knob]", 1, 1, 2, 0.001):si.smoo;
    };
