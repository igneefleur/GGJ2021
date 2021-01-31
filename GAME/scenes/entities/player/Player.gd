extends KinematicBody2D

var list_cris

var target_parent
var target
export (Vector2) var target_position = Vector2(0, 0)

export (int) var hp = 2

var is_in_blurry_light = false
var is_in_bright_light = false
var is_grabing_source = false
export (bool) var is_player = false

export (bool) var sword = false
var attack

export (int) var speed_player = 800
export (int) var speed_blurry = 100
export (int) var speed_bright = 600

var dash = 0

export (float, 0, 1.0) var friction = 0.2
export (float, 0, 1.0) var acceleration = 0.25
var velocity = Vector2.ZERO


func scream():
	var n = rand_range(0, 5)
	list_cris[n].play()
	print(list_cris[n])
	pass

func _ready():
	list_cris = [$Cris/Cri01, $Cris/Cri02, $Cris/Cri03, $Cris/Cri04, $Cris/Cri05, $Cris/Cri06]
	
	
	$AnimationPlayer.playback_speed = 1
	pass

func set_target(t):
	target = t
	pass

func hit(n):
	hp -= n
	if hp <= 0 :
		remove_child(target)
		target_position = position
		target_parent.add_child(target)
		target.show_sprite()
		target.position = target_position
		target.collision_mask = 2
		target.parazite = null
		queue_free()
	pass

func _physics_process(delta):
	var dir = Vector2()
	var speed = 0
	# INPUT
	if !attack :
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
		elif is_grabing_source :
			target.position = target_position
			target.bodies_in_blurry_zone
			if !$AnimationPlayer.is_playing():
				is_player = true
			pass
		elif is_in_bright_light :
			if target.parazite == null and target.number_bodies_in_blurry_zone > 1 :
				
				pass
			if target.parazite == null :
				dir = (target.get_position_up().global_position - global_position).normalized()
				#var distance_to_player = global_position.distance_to(target.global_position)
				speed = speed_bright
				pass
				if $CollisionShape2D/Down.is_colliding() :
					if $CollisionShape2D/Down.get_collider() == target :
						target_parent = target.get_parent()
						target_parent.remove_child(target)
						add_child(target)
						target.collision_mask = 0
						is_grabing_source = true
						target.parazite = self
						target.position = Vector2(0, 0)
						target.hide_sprite()
						$AttackZone.free()
						$AnimationPlayer.play("player_grab_source")
						$AnimationPlayer.playback_speed = 1
						dir = Vector2(0, 0)
					pass
			else :
				dir = (target.global_position - global_position).normalized()
				#var distance_to_player = global_position.distance_to(target.global_position)
				speed = speed_bright

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
		elif sword :
			if dir.length() != 0 :
				if abs(dir.x) > abs(dir.y):
					if dir.x > 0 and $AnimationPlayer.current_animation != "player_sword_walk_right" :
						$AnimationPlayer.play("player_sword_walk_right")
						pass
					elif dir.x < 0 and $AnimationPlayer.current_animation != "player_sword_walk_left" :
						$AnimationPlayer.play("player_sword_walk_left")
						pass
				else :
					if dir.y >= 0 and $AnimationPlayer.current_animation != "player_sword_walk_down" :
						$AnimationPlayer.play("player_sword_walk_down")
						pass
					elif dir.y < 0 and $AnimationPlayer.current_animation != "player_sword_walk_up" :
						$AnimationPlayer.play("player_sword_walk_up")
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
				if abs(dir.x) > abs(dir.y):
					if dir.x > 0 and $AnimationPlayer.current_animation != "player_walk_right" :
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
		pass
	pass # Replace with function body.


func _on_AttackZone_body_exited(body):
	if target != null and body == target.parazite :
		pass
	pass # Replace with function body.


func _on_AttackRight_body_entered(body):
	if target != null and body == target.parazite :
		attack = true
		body.hit(1)
		$AnimationPlayer.play("player_attack_right")
		pass
	pass # Replace with function body.


func _on_AnimationPlayer_animation_finished(anim_name):
	if attack :
		attack = false
	pass # Replace with function body.


func _on_AttackLeft_body_entered(body):
	if target != null and body == target.parazite :
		attack = true
		body.hit(1)
		$AnimationPlayer.play("player_attack_left")
		pass
	pass # Replace with function body.


func _on_AttackDown_body_entered(body):
	if target != null and body == target.parazite :
		attack = true
		body.hit(1)
		$AnimationPlayer.play("player_attack_down")
		pass
	pass # Replace with function body.


func _on_AttackUp_body_entered(body):
	if target != null and body == target.parazite :
		attack = true
		body.hit(1)
		$AnimationPlayer.play("player_attack_up")
		pass
	pass # Replace with function body.
