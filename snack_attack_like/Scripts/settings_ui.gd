extends Control

@onready var sound_btn_label = $VBoxContainer/SoundButton/TextLabel
@onready var music_btn_label = $VBoxContainer/MusicButton/TextLabel

func _ready() -> void:
	set_music_btn_label(GameSaver.get_music())
	set_sound_btn_label(GameSaver.get_sound())

func set_sound_btn_label(param : bool) -> void :
	if param :
		sound_btn_label.text = "sound: on"
	else :
		sound_btn_label.text = "sound: off"
		
func set_music_btn_label(param : bool) -> void :
	if param :
		music_btn_label.text = "music: on"
	else :
		music_btn_label.text = "music: off"

func _on_back_button_pressed() -> void:
	AudioManager.btn_clic.play()
	SceneManager.set_current_scene(SceneManager.Scene.MENU_SCENE)
	
func _on_sound_button_pressed() -> void:
	AudioManager.btn_clic.play()
	GameSaver.set_sound(not GameSaver.get_sound())
	set_sound_btn_label(GameSaver.get_sound())
	
func _on_music_button_pressed() -> void:
	AudioManager.btn_clic.play()
	GameSaver.set_music(not GameSaver.get_music())
	set_music_btn_label(GameSaver.get_music())
	
func _on_reset_button_pressed() -> void:
	AudioManager.btn_clic.play()
	GameSaver.reset_all()
	set_sound_btn_label(GameSaver.get_sound())
	set_music_btn_label(GameSaver.get_music())
