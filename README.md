# zosimos
Zosimos is an ongoing project for an open source hardware drum synthesizer with swappable engines, an extensive modulation matrix, per track and global effects and an additional per track sample player.  
It is heavily inspired by Elektron machines such as the Octatrack and MachineDrum, but also Sonic Potion's LXR, Arturia's microfreak or Korg's Electribe and Electribe 2.

*All this information is subject to change in the future as the project is still in a very early stage*  

## Testing
Individual engines can be tested using the FAUST online IDE.
Just upload the .dsp file and the corresponding dependency libs to the editor, compile the .dsp file and the UI should pop up on the bottom of the page.

## Architecture
The editing of all engine, sampler, effects and envelope parameters will be done through pages, allowing to show parameter values on the onboard display.
Each page is composed of 4 parameters.
Each voice will feature 8 pages :
- 2 ENG pages for the 8 engine parameters.
- 1 ENV page for the volume envelope parameters.
- 1 SMP for the sample parameters.
- 1 VCF for the filter parameters.
- 1 FX for the per track effect parameters.
- 1 Mix page for mixer settings (volume, panning and effect routing).
- 1 MOD page for the modulation shape, routing etc.

In addition to this, 5 pages will be available for the whole project :
- 4 FX pages for 4 global effects.
- 1 MIDI page for MIDI project settings.

## Engines

The drum machine will feature a modular architecture, allowing developers to add their own engines.
Each engine must have a maximum of eight parameters in order to be compatible with the planned hardware and modulation system.
For the moment, the planned engines are the following :
 - **93 Bang Bang** : an analog style kick synthesizer with variable waveforms and noise transient control. **TO FINISH**
 - **Addictive** : a simple additive drum voice with experimental partial controls. **FINISHED**
 - **Bitwise** : an experimental drum voice based on bitwise operations between two PWM square waves. **FINISHED**
 - **Modal Drums** : a simple physical modeling engine consisting of a modal drum and a waveguide transient excited by noise. **TO FINISH**
 - **Noisy** : a noise based drum voice with noise filtering and noise resolution control. **TO FINISH**
 - **FM metal** : an FM drum voice aimed at producing metallic percussion sounds. **FINISHED**
 - **Input** : an envelope on incoming audio to turn any sound source into a drum voice. **FINISHED**

More details about each engine can be found in the .lib or .dsp file of the engine.

## Code

All DSP is coded in FAUST. The effects and engine DSP is found inside the *libs* folder and is instantiated in the *ui* folder for testing on a computer.  
FAUST code will be compiled in C++ to run on Teensy, which will take care of MIDI and voice/FX allocation.

## Hardware

For the moment development is focused on DSP of engines and effects, but the plan is to make everything run on a Teensy 4.1 with a display, some knobs, encoders and buttons.

## Progression

Here you can follow the development of each feature. Feel free to get in touch and contribute to the project, currently I'm compeletely alone and the development is **veeeeery** slow.  
For the moment I'm working on the individual components.  
The modulation matrix, mixer structure etc. will only be done once all the engines and FX sound as they should.

- [x] Bitwise engine
- [ ] 93 Bang Bang engine
- [x] Addictive engine
- [ ] Noisy engine
- [x] FM metal engine
- [x] Input engine
- [x] Per voice filter
- [x] Distortion
- [ ] Reverb
- [ ] Delay
- [ ] Chorus
- [ ] Flanger
- [x] LFO/Envelope system
- [x] Mixer with panning and gain control
