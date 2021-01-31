extends CanvasLayer

signal retour
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


#	pass


func _on_OptionMenu_retour():
	emit_signal("retour")
	pass # Replace with function body.
