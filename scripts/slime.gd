extends Area2D

@onready var ray_cast_left = $RayCastLeft
@onready var ray_cast_right = $RayCastRight
@onready var animatedSlime = $AnimatedSprite2D
var direction = 1
var speed = 60

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_left.is_colliding():
		direction = 1
	elif ray_cast_right.is_colliding():
		direction = -1
		
	if direction == 1:
		animatedSlime.flip_h = false
	elif direction == -1:
		animatedSlime.flip_h = true
		
	position.x += direction * speed * delta
