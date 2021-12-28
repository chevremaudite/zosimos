import("stdfaust.lib");
import("filter.lib");
import("volenv.dsp");

add = hgroup("Addictive", additive(pitch, ratioList, gainList)*(addTrig:volEnv))
with{
    additive(freq,freqRatio,gain) = par(i,N,os.osc(modeFreq(i))*modeGain(i)) :> _
    with {
    N = ba.count(freqRatio);
    modeFreq(i) = freq*ba.take(i+1,freqRatio);
    modeGain(i) = ba.take(i+1,gain);
    };
    addTrig = button("[8]trig"); 
    //pitchDecay = vslider("[1]Pitch_Decay[style:knob]", 0, 0, 0.2, 0.01);
    ratioList = ba.subseq((1, 1+interval, 1+2*interval+oddness, 1+3*interval, 1+4*interval+oddness, 1+5*interval, 1+6*interval+oddness, 1+7*interval, 1+8*interval+oddness, 1+9*interval, 1+10*interval+oddness, 1+11*interval, 1+12*interval+oddness, 1+13*interval, 1+14*interval+oddness, 1+15*interval, 1+16*interval+oddness, 1+17*interval), 0, 18)
    with {
        oddness = vslider("[3]Oddness[style:knob]", 1, 0, 200, 0.001);
        interval = vslider("[2]Harm interval[style:knob]", 0, 0, 0.99, 0.001);
    };
    gainList = (1, harms, harms/2, harms/3, harms/4, harms/5, harms/6, harms/7, harms/8, harms/9, harms/10, harms/11, harms/12, harms/13, harms/14, harms/15, harms/16, harms/17);
    harms = vslider("[1]Harm number[style:knob]", 0.2, 0, 0.6, 0.001);
    pitch = exp(vslider("[1]Pitch [style:knob]", log(200), log(50), log(4200), 0.01):si.smoo);
    vol=vslider("[9]Volume[style:knob]", 0.5, 0,1,0.01):si.smoo;
};
