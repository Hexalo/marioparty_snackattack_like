extends Node3D

# ---------- VARIABLES ---------- #

var const_wait_time = 1.5

var score
var life
var wait_time

# ---------- FUNCTIONS ---------- #

func _ready() -> void:
	set_game_var()

func _process(_delta):
	show_mouse_cursor()
	game_over()
	calculate_wait_time()
	
func set_game_var():
	score = 0
	life = 3 
	wait_time = const_wait_time	
	
# Making Cursor visible using "mouse_visible" key which is assigned in Project Settings > Input Map
func show_mouse_cursor():
	if Input.is_action_just_pressed("mouse_visible"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func game_over():
	if life <= 0 :
		set_game_var()
		get_tree().reload_current_scene()
		
func calculate_wait_time():
	if wait_time >= 0.5 :
		wait_time = const_wait_time - score * 0.05 # TODO logarithmic difficulty scale

func add_score():
	score += 1
	
func dec_life():
	life -= 1
