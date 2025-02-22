extends Area3D

# ---------- VARIABLES ---------- #

@onready var spawn_position = %SpawnPosition
@onready var player = get_tree().get_first_node_in_group("Player")

# ---------- SIGNALS ---------- #

func _on_body_entered(body):
	if body.is_in_group("Player"):
		GameManager.game_over()
	
	if body.is_in_group("Enemies") or body.is_in_group("Item"):
		body.queue_free()
