extends Node

var score = 0
@onready var label = $Score

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	label.text = "You get " + str(score) + " coins"
	pass

func add_score():
	score += 1
