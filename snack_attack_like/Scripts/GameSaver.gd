extends Node

var settings = {
	"highscore" : 0, 
	"music_on" : true, 
	"sound_on" : true
	}

var filename = "user://savegame.json"

func _ready() -> void:
	load_game();

func save_game() -> void:
	var save_file = FileAccess.open(filename, FileAccess.WRITE)

	for key in settings :							
		var json_string = JSON.stringify({key : settings[key]})
		save_file.store_line(json_string)
	
func load_game() :
	if not FileAccess.file_exists(filename):
		save_game()

	else :
		var save_file = FileAccess.open(filename, FileAccess.READ)
		
		while save_file.get_position() < save_file.get_length():
			var json_string = save_file.get_line()
			var json = JSON.new()
			var parse_result = json.parse(json_string)
			var node_data = json.data
			
			settings[node_data.keys()[0]] = node_data.values()[0]

func get_highscore() -> int : 
	var highscore = settings["highscore"]
	return highscore

func set_highscore(score : int) -> void :
	settings["highscore"] = score
	save_game()
	
func set_music(on_off : bool) :
	settings["music_on"] = on_off
	save_game()

func get_music() :
	return settings["music_on"]

func set_sound(on_off : bool) :
	settings["set_sound_on"] = on_off
	save_game()

func get_sound() :
	return settings["sound_on"]
