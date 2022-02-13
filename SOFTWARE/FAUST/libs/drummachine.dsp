/*
REFACTOR : Change all the imports styles from import("xx.lib") to xx = library("xx.lib") to avoid conflits

REFACTOR : Make every engine a lib and create separate instanciation .dsp files

REFACTOR : Wrap all the engines in a engine environment

REFACTOR : create a dryWet function to use for all the mix knobs
*/

declare options "[midi:on]";
import ("stdfaust.lib");
import("93bangbang.dsp");
import("noisy.dsp");
import("modal.dsp");
import("add.dsp");
import("fm.dsp");
import("bitwise.dsp");
import("input.dsp");
import("dist.dsp");
//Global
masterVol=hslider("Master Volume[10]", 0.5, 0,1,0.01):si.smoo;
level(i)=hslider("[9]Level[style:knob]", 0.5, 0,1,0.01):si.smoo;
trig(i) = button("[0]T") : ba.impulsify;
//UI
drumsounds = vgroup("[1]Drum Sounds", d1,d2,d3,d4,d5,d6,d7 :> _);
d1 = hgroup("[1]1", (trig(1)<:bb93,level(1)) : * : dist <: filterUI);
d2 = hgroup("[2]2", (trig(2)<:md, level(2)) : * : dist <: filterUI);
d3 = hgroup("[3]3", (trig(3)<:noisy, level(3)) : * : dist <: filterUI);
d4 = hgroup("[4]4", (trig(4)<:add, level(4)) : * : dist <: filterUI);
d5 = hgroup("[5]5", (trig(5)<:fm, level(5)) : * : dist <: filterUI);
d6 = hgroup("[6]6", (trig(6)<:bitwise, level(6)) : * : dist <: filterUI);
d7 = hgroup("[7]7", (_ : input(trig(7)) * level(7)) : dist <: filterUI);

process = _,_ :> sp.stereoize(drumsounds*masterVol);