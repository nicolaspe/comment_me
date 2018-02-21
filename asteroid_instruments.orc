;orc file

sr = 44100 ;  audio sampling rate
kr = 4410  ;  refresh rate of 'scheduler'
ksmps = 10 ;  # samples in a control period

nchnls = 2 ;  # of channels

instr 1   ; instrument #1 - oscillator/flute
    ; p3 = duration
    ; p4 = frequency
    ; p5 = amplitude (max)
    ; p6 = pan

    ifn = 1 ; waveform
    ; amplitude envelope: amplitude, attack, duration, decay
    k1 linen 0.9, 0.05, p3, 0.25
    a1 oscil p5*k1, p4, ifn
    out a1*(1.0 -p6), a1*p6
endin

instr 2   ; instrument #2 - plucking/guitar
    ; p3 = duration
    ; p4 = frequency
    ; p5 = amplitude (max)
    ; p6 = pan
    ifn = 1 ; waveform
    kmaxamp = 0.6
    a3 pluck p5*kmaxamp, p4, p4, ifn, 1

    out a3*(1.0 -p6), a3*p6
endin
