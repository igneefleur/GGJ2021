extends Node2D

func _ready():
	get_tree().call_group("react_source", "set_target", $Source)




func _on_Source_add_collar():
	$Counter.add_collar()
	pass # Replace with function body.
