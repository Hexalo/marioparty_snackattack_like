extends Control

# ---------- VARIABLES ---------- #

@onready var coinsLabel = $CoinsLabel
@onready var livesLabel = $LivesLabel

# ---------- FUNCTIONS ---------- #

func _process(_delta):
	coinsLabel.text = "x %d" % GameManager.score # Set the coin label text to the score variable
	livesLabel.text = "x %d" % GameManager.life
