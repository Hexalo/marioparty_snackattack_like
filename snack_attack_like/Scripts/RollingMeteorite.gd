extends RigidBody3D

@onready var animation_player = $enemy_1/AnimationPlayer
@onready var _current_scene = get_tree().current_scene

@export	var max_bounce = 3
@export var	explosion_particle : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if position.y <= -3 :
		queue_free()
	
func _on_body_entered(body: Node) -> void:
	if max_bounce <= 0 :
		Utils.emit_particle(explosion_particle, 
							global_position, _current_scene)
		queue_free()
	
	if body.is_in_group("Ground") :
		var x_force = randi_range(-7,7);
		var z_force = randi_range(-7,7);
		
		apply_impulse(Vector3(x_force,3,z_force))
		max_bounce -= 1
		
		animation_player.play("Jump");
		
	if body.is_in_group("Player") :
		GameManager.dec_life()
		Utils.emit_particle(explosion_particle, 
							global_position, _current_scene)
		queue_free()
