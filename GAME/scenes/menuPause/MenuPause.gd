extends Control

var pause = true

signal pausePressed
signal resumePressed
signal OptionPressed

func _ready():
	hide()

#lorsque la touche "p" est appuyé
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		emit_signal("pausePressed")
		pause = not pause
		print("p")

#bouton quit
func _on_Quit_pressed():
	print ("quit")
	get_tree().quit()

#bouton option
func _on_Options_pressed():
	print("option")
	emit_signal("OptionPressed")
	hide()

#bouton resume
func _on_Resume_pressed():
	print("option")
	emit_signal("resumePressed")
