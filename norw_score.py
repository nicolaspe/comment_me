# comment_me
#   by: Camilla Padgitt-Coles
#   Katya Rozanova
#   Nicolas Escarpentier

import numpy  as np
import random as rng
import json

# MIDI to frequency function
def mtof(m):
	f = 440. * np.exp(.057762265 * (m - 69.))
	return f

# MARKOV CHAIN function
def markov(arr):
	thechain = {}
	for ind in range(len(arr)):
		n = arr[ind]
		if n not in list(thechain.keys()):
			thechain[n] = []
		thechain[n].append(arr[ (ind+1)%len(arr) ])
	return thechain


score_file = []


# == F TABLE & HARMONICS ==
# made up harmonics
harmonic_log = "f 1 0 16384 10 1.0 0.8 0.6 0.7 0.5 0.0 0.3 0.2"
score_file.append(harmonic_log + "\n")



# == MIDI JSON DATA ==
midi_file = open('Beatles_NorwWood.json', 'r')
midi_json = json.load(midi_file)
midi_file.close()

## ---- FLUTE
flute_notes = []
flute_times = []
flute_durat = []

for note in midi_json["tracks"][2]["notes"]:
    flute_notes.append(note['midi'])
    flute_times.append(note['time'])
    flute_durat.append(note['duration'])

flute_chain = markov(flute_notes)

## ---- GUITAR
guitar_notes = []
guitar_times = []
guitar_durat = []

for note in midi_json["tracks"][4]["notes"]:
    guitar_notes.append(note['midi'])
    guitar_times.append(note['time'])
    guitar_durat.append(note['duration'])



# == CREATE SCORE

## ---- FLUTE
flute = rng.choice(flute_notes)
instr = 1
for i in range(len(flute_notes)):
    # parameters of time
	start= flute_times[i]
	dur  = flute_durat[i]
	# parameters of sound
	freq = mtof( flute )
	amp  = 6000
	pan  = 0.5
	# write line
	note_list = ["i", instr, start, dur, freq, amp, pan, "\n"]
	note_str = " ".join(str(item) for item in note_list)
	score_file.append(note_str)
	# new markov note
	flute = rng.choice( flute_chain[flute] )

## ---- GUITAR
instr = 2
for i in range(len(guitar_notes)):
    # parameters of time
	start= guitar_times[i]
	dur  = guitar_durat[i]
	# parameters of sound
	freq = mtof( guitar_notes[i] )
	amp  = 3000
	pan  = 0.5
	# write line
	note_list = ["i", instr, start, dur, freq, amp, pan, "\n"]
	note_str = " ".join(str(item) for item in note_list)
	score_file.append(note_str)


# == END ==
score_file.append("e")



# == WRITE FILE ==
filename = "norw_markov.sco"
# clear the file
open(filename,"w").close()
# write the lines
sco = open(filename,"w")
sco.writelines(score_file)
sco.close()
