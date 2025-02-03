extends Node3D

# ---------- VARIABLES ---------- #

var const_wait_time = 2

var score
var life
var wait_time

# ---------- FUNCTIONS ---------- #

func _ready() -> void:
	set_game_var()

func _process(_delta):
	show_mouse_cursor()
	
	if life <= 0:
		game_over()
	
func set_game_var():
	score = 0
	life = 3 
	wait_time = const_wait_time	
	
# Making Cursor visible using "mouse_visible" key which is assigned in Project Settings > Input Map
func show_mouse_cursor():
	if Input.is_action_just_pressed("mouse_visible"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func game_over():
	set_game_var()
	get_tree().reload_current_scene()
		
func calculate_wait_time():
	if wait_time >= 0.5 :
		wait_time = const_wait_time - ((log(score + 1) / log(12)) + 
										sin(score - 1.4)/(-9))  
										
func add_score():
	score += 1
	
func dec_life():
	life -= 1
