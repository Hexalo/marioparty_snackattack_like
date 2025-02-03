extends RigidBody3D

@export	var max_bounce = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node) -> void:
	if max_bounce <= 0 :
		queue_free()
	
	if body.is_in_group("Ground") :
		apply_impulse(Vector3(0,3,0))
		max_bounce -= 1
		
	if body.is_in_group("Player") :
		GameManager.dec_life()
		queue_free()
		
		
