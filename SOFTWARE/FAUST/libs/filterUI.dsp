//-----------------FILTER----------------//
//Multimode resonant filter, available for all 8 voices
//--------------PARAMETERS:
//  1 - Filter Type : Type of filter (LP, HP, BP ,???)
//  2 - Cutoff : Filter cutoff
//  3 - Resonance : Filter resonance
//  4 - Mix : Filter mix

import("stdfaust.lib");
import("filter.lib");

process = filter(type, cutoff, res, mix)
with{
  type = hslider("[0]Filter Type[style:menu{'LP':0;'HP':1;'BP':2}]", 0, 0,2,1);
  cutoff = exp(vslider("[1]Cutoff[style:knob]", log(10000),log(1),log((48000/2)-2000),0.01):si.smoo);
  res = vslider("[2]Resonance[style:knob]", 1,1,10,0.01):si.smoo;
  mix = hslider("[4]Filter Mix [style:knob]", 0, 0, 1, 0.001):si.smoo;
};
