extends Control

# ---------- VARIABLES ---------- #

@onready var coinsLabel = $Playing/CoinsLabel
@onready var livesLabel = $Playing/LivesLabel
@onready var livesTexture = $Playing/LivesTexture
@onready var playing_group = $Playing
@onready var paused_group = $Paused

@onready var livesTextures = [
	load("res://Assets/Ui/no_life_hud.png"),
	load("res://Assets/Ui/low_life_hud.png"),
	load("res://Assets/Ui/half_life_hud.png"),
	load("res://Assets/Ui/full_life_hud.png") 
	]

# ---------- FUNCTIONS ---------- #

func _process(_delta):
	coinsLabel.text = "%d" % GameManager.score 
	livesLabel.text = "%d" % GameManager.life
	
	livesTexture.texture = livesTextures[GameManager.life]
	
	if get_tree().paused :
		playing_group.hide()
		paused_group.show()
	else :
		playing_group.show()
		paused_group.hide()
