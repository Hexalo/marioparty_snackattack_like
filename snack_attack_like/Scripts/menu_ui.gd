extends Control

@onready var score_label = $ScoreHBoxContainer/ScoreLabel
@onready var top_label = $TopHBoxContainer/TopLabel

func _ready() -> void:
	score_label.set_text(str(GameManager.get_score()))
	top_label.set_text(str(GameSaver.get_highscore()))
	
func _on_play_button_pressed() -> void:
	GameManager.set_game_var()
	SceneManager.set_current_scene(SceneManager.Scene.GAMEPLAY_SCENE)
