extends Area2D

var level


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func give_body() -> Node2D:
	var gef = get_overlapping_bodies()
	if gef.is_empty():
		return null
	else:
		return gef[0]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
