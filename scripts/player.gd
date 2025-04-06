extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -300.0
@onready var animated_player = $AnimatedSprite2D

var is_jumping: bool = false
var is_double_jumping: bool = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		animated_player.play("idle")
		is_jumping = false
		is_double_jumping = false
		
	if Input.is_action_just_pressed("jump") and is_jumping and not is_double_jumping:
		print("is_double_jumping")
		velocity.y = JUMP_VELOCITY
		animated_player.play("jump")
		is_double_jumping = true

	# Handle jump.
	if Input.is_action_just_pressed("jump") and not is_jumping:
		print("is_jumping")
		velocity.y = JUMP_VELOCITY
		animated_player.play("jump")
		is_jumping = true
	
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	
	if direction < 0:
		animated_player.flip_h = true
	elif direction > 0:
		animated_player.flip_h = false
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()
