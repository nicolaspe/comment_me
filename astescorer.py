# AsteScorer
#   by: Camilla Padgitt-Coles
#   Katya Rozanova
#   Nicolas Escarpentier

import numpy  as np
import random as rng
import json
import dateutil.parser as dateparser

# MIDI to frequency function
def mtof(m):
	f = 440. * np.exp(.057762265 * (m - 69.))
	return f



# == JSON data ==
aster_file = open('asteroids_comets.json')
aster_data = json.load(aster_file)
aster_file.close()



# == GLOBAL VARIABLES ==
score_file = []
month_interval = 5. # in sec
year_mult = 12 # multiplier (how many months in a year)
total_time = month_interval * 12 * 6

# scale - 3 octaves
base = 58   # b flat
minor = [0, 2, 3, 5, 7, 8, 10]
scale = []
for i in range(21):
    octave = int(i/7)
    scale.append( base +(12*octave) +minor[i%len(minor)] )

# orbit types for defining instruments
types = []
[types.append(a['orbit_class']) for a in aster_data if a['orbit_class'] not in types]



# == F TABLE & HARMONICS ==
score_file.append("f1 0 16384 10 1." + "\n")
score_file.append("f2 0 16384 10 1 0.8 0.9 0.2 0.5" + "\n")
score_file.append("f3 0 16384 10 1 0.1 0.1 0.8 0.9" + "\n")
score_file.append("f4 0 16384 10 1 0.9 0.9 0.5 0.2" + "\n")
score_file.append("\n")



# == LOOP over asteroids ==
for a in aster_data:
    # get raw data
    datetime = dateparser.parse(a['discovery_date'])
    yea = datetime.year       # starting time
    mon = datetime.month      # starting time
    day = datetime.day        # starting time
    deg = float(a['i_deg'] )  # sets the freq
    orbit = a['orbit_class']  # selects the instrument
    qau1 = float(a['q_au_1']) # sets the duration

    # first occurrence (starting in 2010)
    start = ((yea-2010)*year_mult + mon + day/30.) * month_interval
    dur  = qau1 * 2
    freq = mtof( scale[ int(deg/9) ] )
    amp  = rng.random()*2000 + 4000
    pan  = rng.random()*0.6 + 0.2
    instr = types.index(orbit) +1
    # write line
    note_list = ["i", instr, start, dur, freq, amp, pan, "\n"]
    note_str = " ".join(str(item) for item in note_list)
    score_file.append(note_str)

    # recursion
    if orbit != 'Parabolic Comet':
        recur = float(a['period_yr'])  # convert to number
        start += recur *year_mult
        while start < total_time:
            # write line - as we already have all the parameters
            note_list = ["i", instr, start, dur, freq, amp, pan, "\n"]
            note_str = " ".join(str(item) for item in note_list)
            score_file.append(note_str)
            # jump to the next apparition
            start += recur *year_mult



# == END ==
score_file.append("e")



# == WRITE FILE ==
filename = "asterscore.sco"
# clear the file
open(filename,"w").close()
# write the lines
sco = open(filename,"w")
sco.writelines(score_file)
sco.close()
