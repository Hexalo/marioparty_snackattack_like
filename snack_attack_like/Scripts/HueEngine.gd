extends Node3D

@onready var spotlight_1 = $SpotLight3D
@onready var spotlight_2 = $SpotLight3D2
@onready var platform = $playground/Cube
@onready var world_env = $WorldEnvironment

@onready var current_hue : float = randf() * 359
@onready var alter_hue : float = fmod((current_hue + 359 / 2), 359)

var DEFAULT_LIGHTNESS = 0.69
var DEFAULT_SATURATION = 0.5
var DEFAULT_ALPHA = 1

func _ready() -> void :
	set_light_color()
	set_fogs_env_color()
	set_platform_color()
	
func set_platform_color() -> void :
	platform.mesh.surface_get_material(0).albedo_color = Color.from_hsv(
															alter_hue / 359,
															0.3, 
															1, 
															DEFAULT_ALPHA)
	
func set_fogs_env_color() -> void :
	world_env.environment.fog_light_color = Color.from_hsv(current_hue / 359, 
															DEFAULT_SATURATION, 
															DEFAULT_LIGHTNESS, 
															DEFAULT_ALPHA)
	
func set_light_color() -> void :
	spotlight_1.light_color = Color.from_hsv(current_hue / 359, 
												DEFAULT_SATURATION, 
												DEFAULT_LIGHTNESS, 
												DEFAULT_ALPHA)
	
	spotlight_2.light_color = Color.from_hsv(
									alter_hue / 359,
									DEFAULT_SATURATION, 
									DEFAULT_LIGHTNESS, 
									DEFAULT_ALPHA)
