extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


signal OptionPressed
signal resumedPressed

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_MenuPause_OptionPressed():
	emit_signal("OptionPressed")
	pass # Replace with function body.


func _on_MenuPause_resumedPressed():
	emit_signal("resumedPressed")
	pass # Replace with function body.
