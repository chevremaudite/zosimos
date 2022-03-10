//-----------------ENVELOPE----------------//
//Simple volume envelope with attack, release and a release curve control.
//--------------PARAMETERS:
//  1 - Attack : envelope attack time
//  2 - Release : envelope release time
//  3 - Hold : envelope hold time
//  4 - Curve : curve type (linear to exponential) for attack and release


no = library("noises.lib");
env = library("volenv.lib");

volEnv = hgroup("[0]Volume Envelope", _ : env.volenv(volA, volH, volD, curve))
with{
  volA = vslider("[0]Attack[style:knob]", 0.2, 0.00, 1, 0.001);
  volH = vslider("[1]Hold[style:knob]", 0.2, 0.00, 1, 0.001);
  volD = vslider("[2]Decay[style:knob]", 0.2, 0.00, 1, 0.001);
  curve = vslider("[3]Curve[style:knob]", 0.0001, 0, 1, 0.000001);
};
