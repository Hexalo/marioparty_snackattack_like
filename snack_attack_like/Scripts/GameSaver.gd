extends Node

var highscore = 0
var filename = "user://savegame.json"

func _ready() -> void:
	highscore = load_highscore();

func save_highscore(score : int) -> void:
	var save_file = FileAccess.open(filename, FileAccess.WRITE)
	var serializable_var = {"highscore" : highscore}
	var json_string = JSON.stringify(serializable_var)
	
	save_file.store_line(json_string)
	
func load_highscore() -> int :
	if not FileAccess.file_exists(filename):
		save_highscore(highscore)
		
		return 0
	else :
		var save_file = FileAccess.open(filename, FileAccess.READ)
		var json_string = save_file.get_line()
		var json = JSON.new()
		var parse_result = json.parse(json_string)
		var node_data = json.data
		var loaded_highscore = node_data["highscore"]
		
		return node_data["highscore"]

func get_highscore() -> int : 
	return highscore

func set_highscore(score : int) -> void :
	highscore = score
	save_highscore(highscore)
