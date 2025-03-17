extends Node

@onready var animation_player = $AnimationPlayer

var gameplay_scene = preload("res://Scenes/gameplay_scene.tscn")
var menu_scene = preload("res://Scenes/MenuUi.tscn")
var settings_scene = preload("res://Scenes/SettingsUi.tscn")

enum Scene
{
	MENU_SCENE,
	MENU_GAMEOVER_SCENE,
	GAMEPLAY_SCENE,
	SETTINGS_SCENE
}

func change_scene(scene : PackedScene, animation : String) -> void : 
	animation_player.play(animation)
	await(animation_player.animation_finished)
	get_tree().change_scene_to_packed(scene)
	animation_player.play_backwards(animation)


func set_current_scene(SCENE : Scene) -> void :
	match SCENE : 
		Scene.MENU_SCENE :
			change_scene(menu_scene, "diamond_transition")
		Scene.GAMEPLAY_SCENE :
			change_scene(gameplay_scene, "diamond_transition")
		Scene.SETTINGS_SCENE :
			change_scene(settings_scene, "diamond_transition")
		Scene.MENU_GAMEOVER_SCENE :
			change_scene(menu_scene, "gameover_transition")	
			get_tree().paused = false

func _input(event):
	if (event.is_action_pressed("pause") 
	and get_tree().current_scene.name == "GameplayScene"
	and GameManager.get_life() > 0) :
		if get_tree().paused :	
			get_tree().paused = false 
		else :
			get_tree().paused = true
