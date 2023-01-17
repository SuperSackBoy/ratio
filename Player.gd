extends KinematicBody2D


var direction = 0
var speed = 0
var velocity = Vector2()

func turn_inputs():
	if Input.is_action_just_pressed("left"):
		direction -= 5
	if Input.is_action_just_pressed("right"):
		direction += 5
		
	rotate(deg2rad(direction))
	
	direction = lerp(direction, 0, 0.1)
	
func move_inputs():
	if Input.is_action_just_pressed("forward"):
		speed -= 250
	if Input.is_action_just_pressed("back"):
		speed += 250
	
	speed = lerp(speed, 0, 0.1)
	velocity = Vector2(0, speed).rotated(rotation)
	
func _process(delta):
	turn_inputs()
	move_inputs()
	
	move_and_slide(velocity)

