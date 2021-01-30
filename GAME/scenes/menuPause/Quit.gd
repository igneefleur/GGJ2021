extends Button

export (String) var english_text = "English"
export (String) var french_text = "French"

func _ready():
	text = english_text
	pass 


func set_language(language):
	if language == "English" :
		text = english_text
		pass
	elif language == "Francais" :
		text = french_text
		pass
	pass
