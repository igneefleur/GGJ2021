extends RigidBody2D

var parazite = null
var number_bodies_in_blurry_zone = 0
var bodies_in_blurry_zone = []

var collars = 0

func _ready():
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
