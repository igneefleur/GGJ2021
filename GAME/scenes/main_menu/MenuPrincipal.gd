extends TextureRect

signal lanceOption

func _ready():
	pass # Replace with function body.


func _on_Quit_pressed():
	get_tree().quit()

func _on_Option_pressed():
	emit_signal("lanceOption")
	pass # Replace with function body.
