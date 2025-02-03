extends Node3D

@export var rolling_meteorite_scene : PackedScene
@export var exploding_meteorite_scene : PackedScene
@export var coin_scene : PackedScene

@onready var spawn_point = $SpawnPath/SpawnPoint

enum spawned_object_enum {ROLLING_M, EXPLODING_M, COIN}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_object_timer_timeout() -> void:
	spawn_point.progress_ratio = randf()
	var spawned_object = get_random_object_to_spawn()
	add_child(spawned_object)
	spawned_object.position.x = spawn_point.position.x
	spawned_object.position.z = spawn_point.position.z
	spawned_object.position.y = 14
	
		
func get_random_object_to_spawn():
	var rand_int = randi_range(0, 2)
	var spawned_object = null
	
	if rand_int == spawned_object_enum.ROLLING_M :
		spawned_object = rolling_meteorite_scene.instantiate()
	if rand_int == spawned_object_enum.EXPLODING_M :
		spawned_object = exploding_meteorite_scene.instantiate()
	if rand_int == spawned_object_enum.COIN :
		spawned_object = coin_scene.instantiate()
		
	return spawned_object
