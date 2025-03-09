extends Node

# ---------- VARIABLES ---------- #

# References
@onready var jump_sfx = $JumpSfx
@onready var coin_sfx = $CoinSfx
@onready var coin_sfx_2 = $CoinSfx2
@onready var explosion = $Explosion
@onready var spring = $Spring
@onready var robot_damage = $RobotDamage
@onready var celebration = $Celebration
@onready var game_over = $GameOver

func _process(delta: float) -> void:
	AudioServer.set_bus_mute(1, !GameSaver.get_sound()) 
	AudioServer.set_bus_mute(2, !GameSaver.get_music()) 

func play_coin_sfx():
	coin_sfx.play(0.25)
	coin_sfx_2.play()

func play_spring():
	spring.pitch_scale = 0.5 + randf()
	spring.play()
	
func play_explosion():
	explosion.pitch_scale = 0.5 + randf()
	explosion.play()
