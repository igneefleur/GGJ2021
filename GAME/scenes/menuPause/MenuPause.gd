extends Control

var pause = false

signal OptionPressed

func _ready():
	hide()

func _on_Quit_pressed():
	get_tree().quit()

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		paused()


func paused():
	pause = not pause
	
	if pause:
		#get_tree().paused = true
		show()
	else:
		hide()
		#get_tree().paused = false


func _on_Options_pressed():
	emit_signal("OptionPressed")
	hide()
	pause = not pause


func _on_Resume_pressed():
	hide()
	get_tree().paused= false
