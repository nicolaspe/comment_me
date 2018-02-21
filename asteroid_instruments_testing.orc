<CsoundSynthesizer>
<CsOptions>
-odac -d
</CsOptions>
<CsInstruments>


sr = 44100 ;  audio sampling rate
kr = 4410  ;  refresh rate of 'scheduler'
ksmps = 10 ;  # samples in a control period
nchnls = 2
0dbfs  = 10000

giSine ftgen 0, 0, 2^10, 10, 1


instr 1   ; instrument #1 - oscillator/flute
     ; p3 = duration
    ; p4 = frequency
    ; p5 = amplitude (max)
    ; p6 = pan
    ifn = 1 ; waveform
    kmaxamp = 0.6
    a1 pluck p5*kmaxamp, p4, p4, 0, 1
    out a3*(2.0 -p6), a3*p6
endin


instr 2   ; instrument #1 - oscillator/flute
     ; p3 = duration
    ; p4 = frequency
    ; p5 = amplitude (max)
    ; p6 = pan
    ifn = 1 ; waveform
    kmaxamp = 0.6
    a3 pluck p5*kmaxamp, p4, p4, 1, 1

    out a3*(1.0 -p6), a3*p6
endin


instr 3   ; instrument #1 - oscillator/flute
     ; p3 = duration
    ; p4 = frequency
    ; p5 = amplitude (max)
    ; p6 = pan
    ifn = 1 ; waveform
    kmaxamp = 0.6
    a3 pluck p5*kmaxamp, p4, p4, 0, 1

    out a3*(1.0 -p6), a3*p6
endin


instr 4   ; instrument #1 - oscillator/flute
    ; p3 = duration
    ; p4 = frequency
    ; p5 = amplitude (max)
    ; p6 = pan

    ifn = 1 ; waveform
    ; amplitude envelope: amplitude, attack, duration, decay
    k4 linen 0.9, 0.05, p3, 0.25
    a4 oscil p5*k1, p4, ifn
    out a4*(1.0 -p6), a4*p6
endin


instr 5   ; instrument #1 - oscillator/flute
    ; p3 = duration
    ; p4 = frequency
    ; p5 = amplitude (max)
    ; p6 = pan

    ifn = 1 ; waveform
    ; amplitude envelope: amplitude, attack, duration, decay
    k1 linen 0.9, 0.05, p3, 0.25
    a1 vco p5*k1, p4, 1, 0.5, 2 ;AMP FREQ wave 1 is sawtooth 2 is sq 3 is tri
    out a1*(1.0 -p6), a1*p6
endin


instr 6   ; instrument #1 - oscillator/flute
     ; p3 = duration
    ; p4 = frequency
    ; p5 = amplitude (max)
    ; p6 = pan

    k6 linseg 0, 0.25, 1*p6, 0.75, 0	; together = 1 sec
    a6 vco p5*k6, p4, 2, 0.5, 3 ;AMP FREQ wave 1 is sawtooth 2 is sq 3 is tri
    outs a6, a6
endin

instr 7   ; instrument #7 - oscillator/flute
    ; p3 = duration
    ; p4 = frequency
    ; p5 = amplitude (max)
    ; p6 = pan

    k7 linseg 0, 0.25, 1, 0.75, 0	; together = 1 sec
    a7 vco p5*k7, p4, 3, 0.5, 3 ;AMP FREQ wave 1 is sawtooth 2 is sq 3 is tri

    outs a7, a7
endin

</CsInstruments>
<CsScore>

f1	0	16384	10 1		; use GEN10 to compute a sine wave
f2	0	16384	10 1 0.8 0.9 0.2 0.5		; use GEN10 to compute a sine wave
f3	0	16384	10 1	0.1 0.1 0.8 0.9	; use GEN10 to compute a sine wave
f4	0	16384	10 1	0.9 0.9 0.5 0.2	; use GEN10 to compute a sine wave


;ins	strt	dur
;i 1 0 1 440 6000 0.5
;i 2 0 1 440 6000 0.5
;i 3 0 1 440 6000 0.5
;i 4 0 1 440 6000 0.5
;i 5 0 1 440 6000 0.5
 i 1 0 1 440 6000 0.5



e					; indicates the end of the score


</CsScore>
</CsoundSynthesizer>
