extends PathFollow2D

var runsspeed = 4
var parentNode = null

func _ready():
	parentNode = get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	progress_ratio += 0.001 * runsspeed
	if progress_ratio >= 1:
		parentNode.damage(3)
		queue_free()



func _on_area_2d_death_now():
	queue_free()
