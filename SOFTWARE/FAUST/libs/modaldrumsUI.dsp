//-----------------MODAL DRUMS----------------//
//Physical modeling engine consisting of a modal drum, a waveguide transient and a blower exciter
//--------------PARAMETERS:
//  1 - Pitch : Drum and transient main pitch
//  2 - Brightness : Drum modes frequency offset
//  3 - Transient Level : Transient volume
//  4 - Transient Position : Transient's strike position
//  5 - Noise Amount : Cutoff of exciter's noise
//  6 - Noise Decay : exciter's noise cutoff exponential envelope's decay
//  7 - Strength : Overall strike/blow strength
//  8 - ????
/*TODO : Find one last interesting parameter !*/
import("stdfaust.lib");
import("modaldrums.lib");
import("volenvUI.dsp");
import("utilities.lib");

process = hgroup("Modal Drums", md(pitch, brightness,
                                transientAmt, transientPos,
                                noiseAmt, noiseDecay,
                                strength, trigger))<:_,_
with{
  trigger = button("T"):ba.impulsify;
  pitch = exp(vslider("[1]Pitch [style:knob]", log(420), log(100), log(4200), 0.01) : si.smoo);
  brightness = vslider("[2]Brightness[style:knob]", 200, 0, 1000, 0.01):si.smoo;
  transientAmt = vslider("[3]Transient Amount[style:knob]",0,0,1,0.001);
  transientPos = vslider("[4]Transient Position[style:knob]",0,0,4,0.001);
  noiseAmt = vslider("[5]Noise Amount[style:knob]", 200, 100, 4200, 0.01):si.smoo;
  noiseDecay = vslider("[6]Noise Decay[style:knob]", 0.01, 0, 3, 0.01);
  strength = vslider("[7]Strength[style:knob]", 0.5, 0, 1, 0.01):si.smoo;
};
