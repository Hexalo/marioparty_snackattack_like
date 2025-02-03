extends Node3D

# ---------- VARIABLES ---------- #

var score = 0
var life = 3

# ---------- FUNCTIONS ---------- #

func _process(_delta):
	show_mouse_cursor()
	game_over()

# Making Cursor visible using "mouse_visible" key which is assigned in Project Settings > Input Map
func show_mouse_cursor():
	if Input.is_action_just_pressed("mouse_visible"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func game_over():
	if life <= 0 :
		life = 3
		score = 0
		get_tree().reload_current_scene()
		
func add_score():
	score += 1
	
func dec_life():
	life -= 1
