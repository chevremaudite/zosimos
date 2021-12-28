declare options "[midi:on]";
import ("stdfaust.lib");
import("93bangbang.dsp");
import("noisyhh.dsp");
import("modaldrums.dsp");
import("add.dsp");
//Global
masterVol=hslider("Master Volume[10]", 0.5, 0,1,0.01):si.smoo;
level(i)=hslider("[9]Level[style:knob]", 0.5, 0,1,0.01):si.smoo;
trig(i) = button("T");
//UI
drumsounds = hgroup("[1]Drum Sounds",row1,row2 : +);
d1 = hgroup("[1]1", (trig(1)<:bb93,level(1)) : * : filterUI);
d2 = hgroup("[2]2", (trig(2)<:mdd, level(2)) : * : filterUI);
d3 = hgroup("[3]3", (hh, level(3)) : * : filterUI);
d4 = hgroup("[4]4", (add, level(4)) : * : filterUI);
row1 = vgroup(" ",(d1,d2):+);
row2 = vgroup(" ", (d3, d4):+);



process = 0,0 : sp.stereoize(drumsounds*masterVol);