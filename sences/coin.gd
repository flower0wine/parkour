extends Area2D

@onready var manager = %GameManager
@onready var animationPlayer = $AnimationPlayer

func _on_body_entered(body: Node2D) -> void:
	manager.add_score()
	animationPlayer.play("pickup")
