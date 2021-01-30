extends KinematicBody2D

var target

export (bool) var is_in_blurry_light = false
export (bool) var is_in_bright_light = false
export (bool) var is_player = false

export (bool) var sword = false

export (int) var speed_player = 800
export (int) var speed_non_player = 700


export (float, 0, 1.0) var friction = 0.2
export (float, 0, 1.0) var acceleration = 0.25
var velocity = Vector2.ZERO

func set_target(t):
	target = t
	pass

func _physics_process(delta):
	
	var dir = Vector2()
	var speed = 0
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
			
		speed = speed_player
		
	elif is_in_bright_light :
		dir = (target.global_position - global_position).normalized()
		#var distance_to_player = global_position.distance_to(target.global_position)
		
		speed = speed_non_player
		pass
		
		
		if $CollisionShape2D/Up.is_colliding() :
			if $CollisionShape2D/Up.get_collider() == target :
				target.get_parent().remove_child(target)
				add_child(target)
				target.position = Vector2(0, 0)
				target.set_collision(false)
				is_player = true
			pass
		
		if $CollisionShape2D/Left.is_colliding() :
			
			pass
		
		if $CollisionShape2D/Down.is_colliding() :
			
			pass
		
		if $CollisionShape2D/Right.is_colliding() :
			print($CollisionShape2D/Right.get_collider())
			
			pass
	elif is_in_blurry_light :
		dir = (target.global_position - global_position).normalized()
		#var distance_to_player = global_position.distance_to(target.global_position)
		
		speed = speed_non_player
		pass
	else : #static
		pass
	
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
	
	pass
