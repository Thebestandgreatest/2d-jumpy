extends KinematicBody2D

const move_speed = 4
const stop_speed = 4
const jump_speed = 550
const max_speed = 400
const gravity = 1000

var landed = true
var velocity := Vector2()

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_up") and landed:
		landed = false
		velocity.y = -jump_speed
		
	velocity.y += gravity * delta
	
	var snap_vector = Vector2(0, 32) if landed else Vector2()
	velocity = move_and_slide_with_snap(velocity, snap_vector, Vector2.UP)
		
	if Input.is_action_pressed("ui_left"):
		if velocity.x > -max_speed:
			velocity.x -= move_speed
	elif Input.is_action_pressed("ui_right"):
		if velocity.x < max_speed:
			velocity.x += move_speed
	else:
		if velocity.x < 10 and velocity.x > -10:
			velocity.x = 0
		else:
			if velocity.x < 0 and abs(velocity.x) > stop_speed:
				velocity.x += stop_speed
			elif velocity.x > 0 and velocity.x > stop_speed:
				velocity.x -= stop_speed
			else:
				velocity.x = 0
	
	if is_on_floor():
		landed = true
	pass
