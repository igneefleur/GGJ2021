extends Control

signal retour

func _ready():
	hide()
	pass

func _on_Button_pressed():
	emit_signal("retour")







