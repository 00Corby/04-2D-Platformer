extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	$Score.text = "Score: " + str(Global.save_data["score"])
	$Health.text = "Health: " + str(Global.health)
