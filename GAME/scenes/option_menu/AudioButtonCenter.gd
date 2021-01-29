extends Button

var list_english_text = ["English", "French","German","Spanish","Italian","Croatian","Polish","Japanese","Chinese","Turkish","Arab"]
var list_french_text = ["Anglais", "Francais","Allemand","Espagnol","Italien", "Croate", "Polonais","Japonais","Chinois","Turque","Arabe"]

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

