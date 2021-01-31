extends CanvasLayer

export (int) var collar_number = 5
var list_collar = []

func _ready():
	$AnimatedSprite.hide()
	for i in range(collar_number):
		var collar = $AnimatedSprite.duplicate()
		collar.position = Vector2(i * 30 + 20, 20)
		list_collar.append(collar)
		
		$AnimatedSprite.play('notok')
		
		add_child(collar)
		collar.show()
		pass
	$AnimatedSprite.queue_free()
	pass

func add_collar():
	$AnimatedSprite.play('ok')
	pass
