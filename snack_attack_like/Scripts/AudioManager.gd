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
@onready var enemy_impact = $EnemyImpact
@onready var coin_bounce = $CoinBounce
@onready var btn_clic = $BtnClic
@onready var btn_play = $BtnPlay

@onready var music = $Music
@onready var music_stream = music.stream


var track_generic_path = "res://Assets/Musics/track_"

class Track :
	var intro : AudioStream
	var part_a : AudioStream
	var part_b : AudioStream
	var volume_db : float
	
	static func create(intro : AudioStream, part_a : AudioStream, 
						part_b : AudioStream, volume_db : float) -> Track:
		var instance = Track.new()
		
		instance.intro = intro
		instance.part_a = part_a
		instance.part_b = part_b
		instance.volume_db = volume_db
		
		return instance
	
var track_1 = Track.create(load(track_generic_path + "1_intro.wav"), 
							load(track_generic_path + "1_a.wav"),
							load(track_generic_path + "1_b.wav"), 3.0)

var track_2 = Track.create(load(track_generic_path + "2_intro.wav"), 
							load(track_generic_path + "2_a.wav"),
							load(track_generic_path + "2_b.wav"), 0.0)

var track_3 = Track.create(load(track_generic_path + "3_intro.wav"), 
							load(track_generic_path + "3_a.wav"),
							load(track_generic_path + "3_b.wav"), 0.5)

var tracks = [track_1, track_2, track_3]

func _ready() -> void:
	set_track()
	
func set_track() :
	var track_num = randi() % 3 
	var track = tracks[track_num]
	
	music_stream.set_clip_stream(0, track.intro)
	music_stream.set_clip_stream(1, track.part_a)
	music_stream.set_clip_stream(2, track.part_b)
	
	music.volume_db = track.volume_db
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
	
func play_bounce_coin():
	coin_bounce.pitch_scale = 0.7 + randf()
	coin_bounce.play()
	
func play_explosion():
	explosion.pitch_scale = 0.7 + randf()
	explosion.play()

func play_intro_music():
	set_track()
	music["parameters/switch_to_clip"] = "Intro"
	
func play_gameplay_music():
	music["parameters/switch_to_clip"] = "PartA"
	
	
