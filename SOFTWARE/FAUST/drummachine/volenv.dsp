import ("stdfaust.lib");
volEnv =  hgroup("[0]Volume Envelope", _<: (en.ar(a,d), en.asre(a,1,d)) : select2(envType))
with{
    envType = hslider("Type[style:menu{'Linear':0;'Exponential':1}]", 0, 0,2,1);
    a = vslider("[0]Attack[style:knob]", 0, 0, 0.4, 0.001);
    d = vslider("[0]Decay[style:knob]", 0.2, 0, 1, 0.001);
};

