extends Button


export (String) var english_text = "English"
export (String) var french_text = "French"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_language(language):
	if language == "English" :
		text = english_text
		pass
	elif language == "Francais" :
		text = french_text
		pass
	pass
