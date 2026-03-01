extends Node

var game_over = false
var game_on = false
var score = 0
var chosen_ship = 1
var mute = false

func reset_values():
	game_over = false
	game_on = false
	score = 0
	chosen_ship = 1
	mute = false

@warning_ignore("unused_parameter")
func _process(delta):
	if mute == true:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), -80)
	else:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), 0)
		
