extends Area2D


func _ready():
	$AnimationPlayer.play("default")
	pass


func _on_Collar_body_entered(body):
	if body.is_in_group('react_source') and body.is_player :
		body.target.collars += 1
		queue_free()
		pass
	pass # Replace with function body.


func _on_AnimationPlayer_animation_finished(anim_name):
	$AnimationPlayer.play("default")
	pass # Replace with function body.
