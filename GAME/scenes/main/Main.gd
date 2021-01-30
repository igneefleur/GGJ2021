extends Node2D


func _ready():
	pass 



func _on_Menu_principal_lanceJeu():
	$"Menu principal".hide()


func _on_Menu_principal_lanceOption():
	$OptionMenu.show()
	$"Menu principal/Start".hide()
	$"Menu principal/Load".hide()
	$"Menu principal/Option".hide()
	$"Menu principal/Quit".hide()



func _on_OptionMenu_retourJeu():
	$OptionMenu.hide()

func _on_OptionMenu_retourMenu():
	$OptionMenu.hide()
	$"Menu principal/Start".show()
	$"Menu principal/Load".show()
	$"Menu principal/Option".show()
	$"Menu principal/Quit".show()




func _on_Map_pause():
	$OptionMenu.show()




