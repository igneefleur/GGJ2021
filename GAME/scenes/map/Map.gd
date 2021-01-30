extends Node2D

signal pause


func _ready():
	pass # Replace with function body.


func _on_pause_button_pressed():
	get_tree().paused= true
	emit_signal("pause")

