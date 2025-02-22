extends Node3D

@onready var particle = $CPUParticles3D 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	particle.emitting = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not particle.emitting :
		queue_free()
