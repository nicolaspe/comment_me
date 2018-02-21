
sr = 44100 ;  audio sampling rate
kr = 4410  ;  refresh rate of 'scheduler'
ksmps = 10 ;  # samples in a control period
nchnls = 2
0dbfs  = 12000


instr 1   ; instrument #1 - pluck
    ; p3 = duration
    ; p4 = frequency
    ; p5 = amplitude (max)
    ; p6 = pan
    ifn = 0 ; ftable

    k1 = 0.6
    a1 pluck p5*k1, p4, p4, ifn, 1

    outs a1*(1.0 -p6), a1*p6
endin


instr 2   ; instrument #2 - pluck
    ; p3 = duration
    ; p4 = frequency
    ; p5 = amplitude (max)
    ; p6 = pan
    ifn = 4 ; ftable

    k2 = 0.6
    a2 pluck p5*k2, p4, p4, ifn, 1

    outs a2*(1.0 -p6), a2*p6
endin


instr 3   ; instrument #3 - pluck
    ; p3 = duration
    ; p4 = frequency
    ; p5 = amplitude (max)
    ; p6 = pan
    ifn = 3 ; ftable

    k3 = 0.6
    a3 pluck p5*k3, p4, p4, ifn, 1

    outs a3*(1.0 -p6), a3*p6
endin


instr 4   ; instrument #4 - oscillator
    ; p3 = duration
    ; p4 = frequency
    ; p5 = amplitude (max)
    ; p6 = pan
    ifn = 3 ; waveform

    ; amplitude envelope: amplitude, attack, duration, decay
    k4 linen 0.9, 0.05, p3, 0.25
    a4 oscil p5*k4*0.4, p4*0.5, ifn

    outs a4*(1.0 -p6), a4*p6
endin


instr 5   ; instrument #5 - oscillator: sawtooth
    ; p3 = duration
    ; p4 = frequency
    ; p5 = amplitude (max)
    ; p6 = pan
    ifn = 2 ; ftable
    iwv = 1 ; waveform

    ; amplitude envelope: amplitude, attack, duration, decay
    k5 linen 0.9, 0.05, p3, 0.25
    a5 vco p5*k5*0.4, p4*0.5, ifn, 0.5, iwv ; AMP FREQ WAVE(1 is sawtooth 2 is sq 3 is tri)
    outs a5*(1.0 -p6), a5*p6
endin


instr 6   ; instrument #6 - oscillator: square
    ; p3 = duration
    ; p4 = frequency
    ; p5 = amplitude (max)
    ; p6 = pan
    ifn = 4 ; ftable
    iwv = 1 ; waveform

    k6 linseg 0, 0.25, 1*p6*0.7, 0.75, 0	; together = 1 sec
    a6 vco p5*k6, p4, ifn, 0.5, iwv ; AMP FREQ WAVE(1 is sawtooth 2 is sq 3 is tri)

    outs a6, a6
endin


instr 7   ; instrument #7 - oscillator: triangle
    ; p3 = duration
    ; p4 = frequency
    ; p5 = amplitude (max)
    ; p6 = pan
    ifn = 4 ; ftable
    iwv = 2 ; waveform

    k7 linseg 0, 0.25, 0.8, 0.5, 0	; together = 1 sec
    a7 vco p5*k7, p4*0.25, ifn, 0.5, iwv ; AMP FREQ WAVE(1 is sawtooth 2 is sq 3 is tri)

    outs a7, a7
endin


instr 8   ; instrument #8 - oscillator: square
    ; p3 = duration
    ; p4 = frequency
    ; p5 = amplitude (max)
    ; p6 = pan
    ifn = 3 ; ftable
    iwv = 1 ; waveform

    k8 linseg 0, 0.25, 0.7, p3, 0
    a8 vco p5*k8, p4*0.25, ifn, 0.5, iwv ; AMP FREQ WAVE(1 is sawtooth 2 is sq 3 is tri)

    outs a8, a8
endin


instr 9   ; instrument #7 - oscillator: triangle
    ; p3 = duration
    ; p4 = frequency
    ; p5 = amplitude (max)
    ; p6 = pan
    ifn = 1 ; ftable
    iwv = 3 ; waveform

    k9 linseg 0, 0.25, 0.7, p3, 0
    a9 vco p5*k9*0.7, p4*0.25, ifn, 0.5, iwv ; AMP FREQ WAVE(1 is sawtooth 2 is sq 3 is tri)

    outs a9, a9
endin
