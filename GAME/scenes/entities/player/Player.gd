extends KinematicBody2D

export (bool) var is_player = false
export (bool) var sword = false

export (int) var speed = 800
export (float, 0, 1.0) var friction = 0.2
export (float, 0, 1.0) var acceleration = 0.25
var velocity = Vector2.ZERO

func _physics_process(delta):
	
	var dir = Vector2()
	# INPUT
	if is_player :
		if Input.is_action_pressed("ui_up"):
			dir.y -= 1
		if Input.is_action_pressed("ui_left"):
			dir.x -= 1
		if Input.is_action_pressed("ui_down"):
			dir.y += 1
		if Input.is_action_pressed("ui_right"):
			dir.x += 1

			
		# MOVE
		if dir.x != 0:
			velocity.x = lerp(velocity.x, dir.x * speed, acceleration)
		else:
			velocity.x = lerp(velocity.x, 0, friction)
		
		if dir.y != 0:
			velocity.y = lerp(velocity.y, dir.y * speed, acceleration)
		else:
			velocity.y = lerp(velocity.y, 0, friction)
			
		velocity = move_and_slide(velocity, Vector2.UP, false,
						4, PI/4, false)
		
