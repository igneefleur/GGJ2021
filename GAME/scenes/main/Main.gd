extends Node2D


func _ready():
	pass 



func _on_OptionMenu_retourMenu():
	$OptionMenu.hide()
	$"Menu principal/Start".show()
	$"Menu principal/Load".show()
	$"Menu principal/Option".show()
	$"Menu principal/Quit".show()
	pass 


func _on_Menu_principal_lanceOption():
	$OptionMenu.show()
	$"Menu principal/Start".hide()
	$"Menu principal/Load".hide()
	$"Menu principal/Option".hide()
	$"Menu principal/Quit".hide()
	pass 
