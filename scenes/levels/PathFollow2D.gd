extends PathFollow2D

var runsspeed = 2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	progress_ratio += 0.001 * runsspeed
