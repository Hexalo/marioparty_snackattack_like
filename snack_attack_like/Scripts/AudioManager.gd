extends Node

# ---------- VARIABLES ---------- #

# References
@onready var jump_sfx = $JumpSfx
@onready var coin_sfx = $CoinSfx
@onready var coin_sfx_2 = $CoinSfx2
@onready var explosion = $Explosion
@onready var spring = $Spring
@onready var robot_damage = $RobotDamage
@onready var celebration = $Celebration
@onready var game_over = $GameOver

@onready var music = $Music
@onready var music_stream = music.stream


var track_generic_path = "res://Assets/Musics/track_"

class Track :
	var intro : AudioStream
	var part_a : AudioStream
	var part_b : AudioStream
	
	static func create(intro : AudioStream, part_a : AudioStream, 
												part_b : AudioStream) -> Track:
		var instance = Track.new()
		
		instance.intro = intro
		instance.part_a = part_a
		instance.part_b = part_b
		
		return instance
	
var track_1 = Track.create(load(track_generic_path + "1_intro.wav"), 
							load(track_generic_path + "1_a.wav"),
							load(track_generic_path + "1_b.wav"))

var track_2 = Track.create(load(track_generic_path + "2_intro.wav"), 
							load(track_generic_path + "2_a.wav"),
							load(track_generic_path + "2_b.wav"))

var track_3 = Track.create(load(track_generic_path + "3_intro.wav"), 
							load(track_generic_path + "3_a.wav"),
							load(track_generic_path + "3_b.wav"))

var tracks = [track_1, track_2, track_3]

func _ready() -> void:
	set_track()
	
func set_track() :
	var track_num = randi() % 3 
	var track = tracks[track_num]
	
	music_stream.set_clip_stream(0, track.intro)
	music_stream.set_clip_stream(1, track.part_a)
	music_stream.set_clip_stream(2, track.part_b)
	
	music.play()

func _process(delta: float) -> void:
	AudioServer.set_bus_mute(1, !GameSaver.get_sound()) 
	AudioServer.set_bus_mute(2, !GameSaver.get_music()) 

func play_coin_sfx():
	coin_sfx.play(0.25)
	coin_sfx_2.play()

func play_spring():
	spring.pitch_scale = 0.5 + randf()
	spring.play()
	
func play_explosion():
	explosion.pitch_scale = 0.5 + randf()
	explosion.play()

func play_intro_music():
	set_track()
	music["parameters/switch_to_clip"] = "Intro"
	
	
func play_gameplay_music():
	music["parameters/switch_to_clip"] = "PartA"
	
	
