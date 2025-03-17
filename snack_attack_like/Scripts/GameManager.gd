extends Node3D

# ---------- VARIABLES ---------- #

@onready var damage_particle = preload("res://Scenes/damageParticle.tscn")
@onready var celebration_particle = preload("res://Scenes/celebrationParticle.tscn")

var menu_scene = preload("res://Scenes/MenuUi.tscn")

var _current_scene
var player

var const_wait_time = 2
var reached_highscore = false
var default_life = 3

var score = 0
var life
var wait_time

# ---------- FUNCTIONS ---------- #

func _ready() -> void:
	set_game_var()

func _process(_delta):
	show_mouse_cursor()
	
func set_game_var():
	score = 0
	life = default_life 
	wait_time = const_wait_time	
	reached_highscore = false
	
# Making Cursor visible using "mouse_visible" key which is assigned in Project Settings > Input Map
func show_mouse_cursor():
	if Input.is_action_just_pressed("mouse_visible"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func game_over():
	while(GameManager.get_life() > 0) :
		GameManager.dec_life()
	
	if (score > GameSaver.get_highscore()) :
		GameSaver.set_highscore(score)
		
	AudioManager.game_over.play()
	SceneManager.set_current_scene(SceneManager.Scene.MENU_GAMEOVER_SCENE)
	
func calculate_wait_time():
	if wait_time >= 0.5 :
		wait_time = const_wait_time - ((log(score + 1) / log(12)) + 
										sin(score - 1.4)/(-9))  

func add_score():
	score += 1
	
	if (score > GameSaver.get_highscore() 
			and GameSaver.get_highscore() > 0 
			and not reached_highscore) :
		_current_scene = get_tree().current_scene
		Utils.emit_particle(celebration_particle, 
							Vector3(0, 2, 0), _current_scene)
		reached_highscore = true

func dec_life():
	life -= 1

	_current_scene = get_tree().current_scene
	player = _current_scene.get_node("Player")
	Utils.emit_particle(damage_particle, 
						player.global_position, _current_scene)
	player.play_shake_animation()
	
	if life <= 0:
		game_over()
	
func get_score() -> int :
	return score

func get_life() -> int :
	return life
	
	
