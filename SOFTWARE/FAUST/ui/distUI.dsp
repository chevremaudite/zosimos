//-----------------DIST----------------//
//Simple distortion effect, available for all 8 voices
//PARAMETERS:
//  1 - Mix : Dry/Wet signal mix
//  2 - Drive : Distortion factor
//  3 - Offset : ????
//  4 - ????
import("stdfaust.lib");
import("dist.lib");

process = dist(mix, drive, offset)
with{
  mix = hslider("[4]Dist Mix [style:knob]", 0, 0, 1, 0.001):si.smoo;
  drive = hslider("[5]Drive [style:knob]", 0, 0, 1, 0.001):si.smoo;
  offset = hslider("[6]Offset [style:knob]", 0, 0, 1, 0.001):si.smoo;
};
