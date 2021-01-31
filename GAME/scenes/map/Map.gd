extends Node2D

func _ready():
	get_tree().call_group("react_source", "set_target", $Source)


