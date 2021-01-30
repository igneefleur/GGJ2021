extends RigidBody2D

var parazite = null

func _ready():
	pass 

func get_position_up():
	return $Position2D
	pass

func set_collision(b):
	$CollisionShape2D.disabled = not b
	pass


func _on_BlurryZone_body_entered(body):
	if body.is_in_group('react_source') :
		body.is_in_blurry_light = true
		pass
	pass

func _on_BlurryZone_body_exited(body):
	if body.is_in_group('react_source') :
		body.is_in_blurry_light = false
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
