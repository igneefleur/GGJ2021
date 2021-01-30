extends TextureRect

signal lanceOption
signal lanceJeu

func _ready():
	pass # Replace with function body.

func _on_Start_pressed():
	emit_signal("lanceJeu")

func _on_Quit_pressed():
	get_tree().quit()

func _on_Option_pressed():
	emit_signal("lanceOption")


