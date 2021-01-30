extends Node2D


var security = false

func _ready():
	pass 



func _on_Menu_principal_lanceJeu():
	$"Menu principal".hide()
	security = true
	print("security" ,security)
	


func _on_Menu_principal_lanceOption():
	$OptionMenu.show()
	$"Menu principal".hide()

func _on_OptionMenu_retour():
	if security:
		$OptionMenu.hide()
	else:
		$OptionMenu.hide()
		$"Menu principal".hide()

func _on_MenuPause_OptionPressed():
	$OptionMenu.show()
	security = false


func _on_MenuPause_pausePressed():
	if $MenuPause.pause and security:
		print("pause", $MenuPause.pause)
		$Map.get_tree().paused = true
		$MenuPause.show()
	else:
		$MenuPause.hide()
		$Map.get_tree().paused = false


func _on_MenuPause_resumePressed():
	$Map.get_tree().paused = false
	#$MenuPause.hide
	
	
