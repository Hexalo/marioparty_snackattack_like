extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func emit_particle(exploding_particle : PackedScene, 
					position : Vector3,
					_current_scene) -> void:
	var exploding_particle_node = exploding_particle.instantiate()
	
	exploding_particle_node.set_global_position(position)
	_current_scene.add_child(exploding_particle_node)
