import("stdfaust.lib");

sub2(x, y) = x-y;

av = 28;
bv = 32;
av2 =32;
bv2 = 28;
process = (sub2 ~ fi.fir(bv) : fi.fir(av)) == (ma.sub ~ fi.fir(av2) : fi.fir(bv2));
