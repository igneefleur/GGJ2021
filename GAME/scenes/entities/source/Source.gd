extends RigidBody2D

signal add_collar

export (int) var hp = 4

var parazite = null
var number_bodies_in_blurry_zone = 0
var bodies_in_blurry_zone = []

var collars = 0
var max_collars = 5

func show_sprite():
	$AnimatedSprite.show()
	pass

func hide_sprite():
	$AnimatedSprite.hide()
	pass

func add_collar():
	collars += 1
	emit_signal("add_collar")
	pass

func get_position_up():
	return $Position2D
	pass


func _on_BlurryZone_body_entered(body):
	if body.is_in_group('react_source') :
		body.is_in_blurry_light = true
		number_bodies_in_blurry_zone += 1
		bodies_in_blurry_zone.append(body)
		pass
	pass

func _on_BlurryZone_body_exited(body):
	if body.is_in_group('react_source') :
		body.is_in_blurry_light = false
		number_bodies_in_blurry_zone -= 1
		bodies_in_blurry_zone.remove(bodies_in_blurry_zone.bsearch(body))
		pass
	pass 


func _on_BrightZone_body_entered(body):
	if body.is_in_group('react_source') :
		body.is_in_bright_light = true
		pass
	pass 

func _on_BrightZone_body_exited(body):
	if body.is_in_group('react_source') :
		body.is_in_bright_light = false
		pass
	pass
