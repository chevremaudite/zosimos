//-----------------INPUT----------------//
//Simple envelope on audio in to turn any sound source into a drum voice
//--------------PARAMETERS:
//  1 - Left Gain : Left input gain
//  1 - Left Gain : Right input gain

import("stdfaust.lib");
import("input.lib");

process = hgroup("Input", input(lGain, rGain, trigger))
with{
    trigger = button("T"):ba.impulsify;
    lGain = hslider("[9]Left Gain[style:knob]", 0.5, 0 , 1 , 0.01);
    rGain = hslider("[9]Right Gain[style:knob]", 0.5, 0 , 1 , 0.01);
};
