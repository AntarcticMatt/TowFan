extends Camera2D

@export var MaxSped = 400

func _process(delta):
	var direction = Input.get_vector("CamLeft", "CamRight", "CamUp", "CamDown")
	position += direction * delta * MaxSped
