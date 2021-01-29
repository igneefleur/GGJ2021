extends Control

signal retourMenu

func _ready():
	hide()
	pass

func _on_Button_pressed():
	emit_signal("retourMenu")
	pass
