extends Area2D

signal lqncerMusiqueLab

func _ready():
	pass # Replace with function body.




func _on_MusicLab_body_entered(body):
	emit_signal("lqncerMusiqueLab")
