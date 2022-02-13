//-----------------MODAL----------------//
//Physical modeling engine consisting of a modal drum, a waveguide transient and a blower exciter
//PARAMETERS:
//  1 - Pitch : Drum and transient main pitch
//  2 - Brightness : Drum modes frequency offset
//  3 - Transient Level : Transient volume
//  4 - Transient Position : Transient's strike position
//  5 - Noise Amount : Cutoff of exciter's noise
//  6 - Noise Decay : exciter's noise cutoff exponential envelope's decay
//  7 - Strength : Overall strike/blow strength
//  8 - TODO : Find one last interesting parameter !

//TODO : Make the volume proportional to the pitch
import("volenv.dsp");
import("utilities.dsp");
djembeModel(freq) = _ <: par(i,nModes,pm.modeFilter(modeFreqs(i),modeT60s(i),modeGains(i))) :> /(nModes)
with{
    nModes = 20;
    theta = 0;
    modeFreqs(i) = freq + brightness*i;
    modeT60s(i) = (nModes-i)*0.03;
    modeGains(i) = cos((i+1)*theta)/float(i+1)*(1/(i+1));
    brightness = vslider("[2]Brightness[style:knob]", 200, 0, 1000, 0.01):si.smoo;
};

md(trig) = hgroup("[1]Modal", ( (!,!) : blower:modals)*(trig:volEnv):drumSmooth)
with{
        blower = pm.blower(strength*(trig:volEnv)/2,0.5*(trig:volEnv),noiseAmount, 5, 0)*(trig:noiseEnv)
    with{
        noiseEnv = en.are(nA,nD)
        with{
            nA = 0;
            nD = vslider("[6]Noise Decay[style:knob]", 0.01, 0, 3, 0.01);
        };
        strength = vslider("[7]Strength[style:knob]", 0.5, 0, 1, 0.01):si.smoo;
        noiseAmount = vslider("[5]Noise Amount[style:knob]", 200, 100, 4200, 0.01):si.smoo;
    };
    modals = _<:djembeModel(pitch),pm.marimbaModel(pitch/2,transientPos)*transient*2 : +
    with{
        transientPos = vslider("[4]Transient Position[style:knob]",0,0,4,0.001);
        transient = vslider("[3]Transient Level[style:knob]",0,0,1,0.001);
        pitch = exp(vslider("[1]Pitch [style:knob]", log(420), log(100), log(4200), 0.01):si.smoo);
    };
    vol=vslider("[9]Level[style:knob]", 0.5, 0,1,0.01):si.smoo;
};
//Uncomment for standalone mode 
process = md(button("T"):ba.impulsify)<:_,_;