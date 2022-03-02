//-----------------ENVELOPE----------------//
//Simple volume envelope with attack, release and a release curve control.
//PARAMETERS:
//  1 - Attack : envelope attack
//  2 - Release : envelope release
//  3 - Curve : curve type (linear to exponential) for attack and release
/*  4 - TODO : hold*/

no = import("noises.lib");
ve = library("volenv.lib");

volEnv = hgroup("[0]Volume Envelope", _ : ce.volenv(volA,volD, curve));
with{
  volA = vslider("[0]Attack[style:knob]", 0.0001, 0, 0.4, 0.000001);
  volD = vslider("[0]Decay[style:knob]", 0.2, 0, 1, 0.001);
  curve = vslider("[1]Curve[style:knob]", 0.0001, 0, 1, 0.000001);
};
