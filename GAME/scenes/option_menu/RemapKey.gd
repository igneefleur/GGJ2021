extends HBoxContainer

export (String) var english_text = "Move Up"
export (String) var french_text = "Se deplacer vers le haut"
export (String) var action = "ui_up"

func _ready():
	$Label.text = english_text
	$Label.english_text = english_text
	$Label.french_text = french_text
	
	$RemapButton.action = action
	$RemapButton._ready()
	pass
