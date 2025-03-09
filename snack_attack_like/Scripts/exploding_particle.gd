extends Node3D

@onready var particle = $CPUParticles3D 
@export var is_explosion = false
@export var is_robot_damage = false
@export var is_celebration = false
@export var is_coin = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play_sound()
	particle.emitting = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not particle.emitting :
		queue_free()

func play_sound():
	if is_explosion:
		AudioManager.play_explosion()
	
	if is_robot_damage:
		AudioManager.robot_damage.play()

	if is_celebration:
		AudioManager.celebration.play()
		
	if is_coin:
		AudioManager.play_coin_sfx()
