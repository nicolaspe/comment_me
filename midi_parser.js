var fs = require('fs');
var MidiConvert = require('midiconvert');
var jsonfile = require('jsonfile')

let file_in  = "The_Beatles_-_Norwegian_Wood.mid";
let file_out = "Beatles_NorgWood.json"
let midi_data;

fs.readFile(file_in, "binary", function(err, midiBlob) {
  if (!err) {
    midi_data = MidiConvert.parse(midiBlob);
		jsonfile.writeFile(file_out, midi_data, function (err2) {
  		console.error(err2)
		})
		// console.log(midi_data)
  } else {
		console.log(err);
	}
})
