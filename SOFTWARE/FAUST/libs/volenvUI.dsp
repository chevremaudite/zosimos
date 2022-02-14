/*TODO : Find a way to make the exponential attack work!!*/

import ("stdfaust.lib");
volEnv =  hgroup("[0]Volume Envelope", _  <: (en.ar(volA,volD)),(en.are(volAE,volDE)) : select2(envType));

envType = hslider("Type[style:menu{'Linear':0;'Exponential':1}]", 1, 0,2,1);
volA = vslider("[0]Attack[style:knob]", 0.0001, 0, 0.4, 0.000001);
volD = vslider("[0]Decay[style:knob]", 0.2, 0, 1, 0.001);
volAE = vslider("[0]Exp Attack[style:knob]", 0.0001, 0, 0.4, 0.000001);
volDE = vslider("[0]Exp Decay[style:knob]", 0.2, 0, 3, 0.001);
smoothing = vslider("[1]Smooth[style:knob]", 0.0001, 0, 0.1, 0.0001);
