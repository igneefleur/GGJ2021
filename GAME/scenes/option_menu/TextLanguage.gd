extends HBoxContainer

var list_languages = ['English', 'Francais']
var position_list = 0

func _ready():
	pass

func _on_ButtonLeft_pressed():
	position_list -= 1
	if position_list < 0 :
		position_list = list_languages.size() - 1

	get_tree().call_group("text", "set_language", list_languages[position_list])
	pass

func _on_ButtonRight_pressed():
	position_list += 1
	if position_list > list_languages.size() - 1 :
		position_list = 0
	get_tree().call_group("text", "set_language", list_languages[position_list])
	pass
