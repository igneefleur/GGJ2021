extends HBoxContainer

var position_list = 0

func _ready():
	pass

func _on_ButtonLeft_pressed():
	position_list -= 1
	if position_list < 0 :
		position_list = $HBoxContainer/AudioButtonCenter.list_english_text.size() - 1
	
	$HBoxContainer/AudioButtonCenter.position_list = position_list
	$HBoxContainer/AudioButtonCenter.set_language($HBoxContainer/AudioButtonCenter.current_text_language)
	pass

func _on_ButtonRight_pressed():
	position_list += 1
	if position_list > $HBoxContainer/AudioButtonCenter.list_english_text.size() - 1 :
		position_list = 0
	
	$HBoxContainer/AudioButtonCenter.position_list = position_list
	$HBoxContainer/AudioButtonCenter.set_language($HBoxContainer/AudioButtonCenter.current_text_language)
	
	
	pass
