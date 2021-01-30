extends Control

signal retourMenu
signal retourJeu


func _ready():
	hide()
	pass

func _on_Button_pressed():
	if (get_tree().paused):
		emit_signal("retourJeu")
		get_tree().paused = false
	else:
		emit_signal("retourMenu")





