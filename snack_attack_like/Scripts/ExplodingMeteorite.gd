extends RigidBody3D

@export var exploding_particle : PackedScene
@export	var max_bounce = 1

@onready var _current_scene = get_tree().current_scene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node) -> void:
	if max_bounce <= 0 :	
		play_effects()
		queue_free()
	
	if body.is_in_group("Ground") :
		apply_impulse(Vector3(0,3,0))
		max_bounce -= 1
		
	if body.is_in_group("Player") :
		play_effects()
		GameManager.dec_life()
		queue_free()

func play_effects():
	Utils.emit_particle(exploding_particle, 
					global_position, _current_scene)
