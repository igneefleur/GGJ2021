extends KinematicBody2D

var target

export (int) var hp = 2

var is_in_blurry_light = false
var is_in_bright_light = false
export (bool) var is_player = false

var attack = false
export (bool) var sword = false

export (int) var speed_player = 800
export (int) var speed_blurry = 100
export (int) var speed_bright = 600

var dash = 0

export (float, 0, 1.0) var friction = 0.2
export (float, 0, 1.0) var acceleration = 0.25
var velocity = Vector2.ZERO

func _ready():
	$AnimationPlayer.playback_speed = 3
	pass

func set_target(t):
	target = t
	pass

func hit(n):
	hp -= n
	if hp <= 0 :
		free()
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
		
		
		if Input.is_action_just_pressed("ui_select") and dash <= 0 :
			dash = 0.5
			pass
		elif dash > 0 :
			dash -= delta
			speed = speed_player * 2
			pass
		else :
			speed = speed_player
		
	elif is_in_bright_light :
		dir = (target.global_position - global_position).normalized()
		#var distance_to_player = global_position.distance_to(target.global_position)
		speed = speed_bright
		
		if target.parazite == self :
			pass
		else :
			if $CollisionShape2D/Up.is_colliding() :
				if $CollisionShape2D/Up.get_collider() == target :
					target.get_parent().remove_child(target)
					add_child(target)
					target.position = Vector2(0, -98)
					target.set_collision(false)
					is_player = true
					target.parazite = self
					$AttackZone.free()
				pass
			if $CollisionShape2D/Left.is_colliding() :
				
				pass
			if $CollisionShape2D/Down.is_colliding() :
				
				pass
			if $CollisionShape2D/Right.is_colliding() :
				
				pass

	elif is_in_blurry_light :
		dir = (target.global_position - global_position).normalized()
		#var distance_to_player = global_position.distance_to(target.global_position)
		speed = speed_blurry
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

	# ANIMATE
	if is_player :
		if dir.length() != 0 :
			print(delta)
			if abs(dir.x) > abs(dir.y):
				if dir.x > 0 and $AnimationPlayer.current_animation != "player_source_walk_right" :
					$AnimationPlayer.play("player_source_walk_right")
					pass
				elif dir.x < 0 and $AnimationPlayer.current_animation != "player_source_walk_left" :
					$AnimationPlayer.play("player_source_walk_left")
					pass
			else :
				if dir.y >= 0 and $AnimationPlayer.play("player_source_walk_down") != "player_source_walk_down" :
					$AnimationPlayer.play("player_source_walk_down")
					pass
				elif dir.y < 0 and $AnimationPlayer.play("player_source_walk_up") != "player_source_walk_up" :
					$AnimationPlayer.play("player_source_walk_up")
					pass
				pass
		else :
			if $AnimationPlayer.current_animation == "player_walk_up" :
				$AnimationPlayer.play("player_stop_up")
				pass
			elif $AnimationPlayer.current_animation == "player_walk_left" :
				$AnimationPlayer.play("player_stop_left")
				pass
			elif $AnimationPlayer.current_animation == "player_walk_down" :
				$AnimationPlayer.play("player_stop_down")
				pass
			elif $AnimationPlayer.current_animation == "player_walk_right" :
				$AnimationPlayer.play("player_stop_right")
				pass
			pass
	else :
		if dir.length() != 0 :
			print(delta)
			if abs(dir.x) > abs(dir.y):
				if dir.x > 0 and $AnimationPlayer.current_animation != "player_walk_right" :
					print('oj')
					$AnimationPlayer.play("player_walk_right")
					pass
				elif dir.x < 0 and $AnimationPlayer.current_animation != "player_walk_left" :
					$AnimationPlayer.play("player_walk_left")
					pass
			else :
				if dir.y >= 0 and $AnimationPlayer.play("player_walk_down") != "player_walk_down" :
					$AnimationPlayer.play("player_walk_down")
					pass
				elif dir.y < 0 and $AnimationPlayer.play("player_walk_up") != "player_walk_up" :
					$AnimationPlayer.play("player_walk_up")
					pass
				pass
		else :
			if $AnimationPlayer.current_animation == "player_walk_up" :
				$AnimationPlayer.play("player_stop_up")
				pass
			elif $AnimationPlayer.current_animation == "player_walk_left" :
				$AnimationPlayer.play("player_stop_left")
				pass
			elif $AnimationPlayer.current_animation == "player_walk_down" :
				$AnimationPlayer.play("player_stop_down")
				pass
			elif $AnimationPlayer.current_animation == "player_walk_right" :
				$AnimationPlayer.play("player_stop_right")
				pass
			pass
	
	pass


func _on_AttackZone_body_entered(body):
	if target != null and body == target.parazite :
		attack = true
	pass # Replace with function body.


func _on_AttackZone_body_exited(body):
	if target != null and body == target.parazite :
		attack = false
	pass # Replace with function body.
