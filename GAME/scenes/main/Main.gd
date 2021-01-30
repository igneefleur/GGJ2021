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
		$MenuPause.show()
	else:
		$OptionMenu.hide()
		$"Menu principal".show()

func _on_MenuPause_OptionPressed():
	$OptionMenu.show()



func _on_MenuPause_pausePressed():
	if $MenuPause.pause and security:
		print("pause", $MenuPause.pause)
		#$Map.paused = true
		$MenuPause.show()
	else:
		$MenuPause.hide()
		#$Map.paused = false


func _on_MenuPause_resumePressed():
	$MenuPause.pause = true
	$MenuPause.hide()
	
	
