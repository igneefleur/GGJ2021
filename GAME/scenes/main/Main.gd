extends Node2D


var security = false

func _ready():
	$Map/Counter.hide_elements()
	pass 



func _on_Menu_principal_lanceJeu():
	$"Menu principal".queue_free()
	$Map/Counter.show_elements()
	security = true
	print("security" ,security)
	


func _on_Menu_principal_lanceOption():
	$OptionMenu/OptionMenu.show()
	$"Menu principal".hide()

func _on_OptionMenu_retour():
	if security:
		$OptionMenu/OptionMenu.hide()
		$MenuPause/MenuPause.show()
	else:
		$OptionMenu/OptionMenu.hide()
		$"Menu principal".show()

func _on_MenuPause_OptionPressed():
	$OptionMenu/OptionMenu.show()



func _on_MenuPause_pausePressed():
	if $MenuPause/MenuPause.pause and security:
		print("pause", $MenuPause/MenuPause.pause)
		#$Map.paused = true
		$MenuPause/MenuPause.show()
	else:
		$MenuPause/MenuPause.hide()
		#$Map.paused = false




func _on_MenuPause_resumedPressed():
	$MenuPause/MenuPause.pause = true
	$MenuPause/MenuPause.hide()
