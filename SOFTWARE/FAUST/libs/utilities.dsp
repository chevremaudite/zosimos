import("stdfaust.lib");


//Custom envelope smoothing function to avoid clicks
//NOTE : perhaps still a bit too smooth
drumSmooth = si.smooth(ba.tau2pole(0.0005));