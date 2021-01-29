extends Button

var list_english_text = ["English", "French","Belgian","Swiss","Canadian"]
var list_french_text = ["Anglais", "Francais","Belge","Suisse","Canadien"]

var current_text_language = 'English'
var position_list = 0

func _ready():
	text = list_english_text[position_list]
	pass 


func set_language(language):
	if language == "English" :
		text = list_english_text[position_list]
		current_text_language = language
		pass
	elif language == "Francais" :
		text = list_french_text[position_list]
		current_text_language = language
		pass
	pass

