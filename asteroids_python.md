## Python script
For each asteroid or comet on the file, we extracted some common characteristics to set the sound parameters. The most important aspect is to portray how often they pass near the Earth, so the representation of the time has to be accurate. We set an equivalence of one month = 5 seconds and a year multiplier of 12 months, in case we wanted to make a longer year to introduce longer periods of silence on the score. The audio file starts on Jan 1, 2010 - the earliest year from the acquired data set. Each rock's discovery date sets its first occurrence on the score, and each occurrence repeats itself according to its `period_yr` (except for the 'Parabolic Comet', which doesn't have a return period).

```python
month_interval = 5. # in sec
year_mult = 12 # multiplier (how many months in a year)

for a in aster_data:
    # get raw data
		datetime = dateparser.parse(a['discovery_date'])
		yea = datetime.year       # starting time
		mon = datetime.month      # starting time
		day = datetime.day        # starting time

		# first occurrence (starting in 2010)
		start = ((yea-2010)*year_mult + mon + day/30.) * month_interval

		# recursion
		start += recur *year_mult
```

For the other parameters, we selected characteristics that gave us some expressive possibilities. The pitch of each rock is based on the orbit's angle (`i_deg`), the instruments are based on the `orbit_class`, the duration on the `q_au_1` (which we have no idea what it actually represents). For the scale of this score, we chose a minor B flat, in reference to [the sound of a black hole and the "lowest note in the universe"](http://www.nytimes.com/2003/09/16/science/music-of-the-heavens-turns-out-to-sound-a-lot-like-a-b-flat.html).
