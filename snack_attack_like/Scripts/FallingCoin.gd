extends RigidBody3D

@onready var spotshadow3d = $SpotShadow3D
@export	var max_bounce = 3

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
		var x_force = randi_range(-2,2);
		var z_force = randi_range(-2,2);
	
		apply_impulse(Vector3(x_force,3,z_force))
		max_bounce -= 1
		
func _on_coin_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		GameManager.add_score()
		GameManager.calculate_wait_time()
		queue_free()
