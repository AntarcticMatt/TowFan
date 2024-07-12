extends Area2D

var sped: int = 1000
var direction: Vector2 = Vector2.UP

func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += direction * sped * delta


func _on_area_entered(area):
#	print("felebe")
	if "hit" in area:
		area.hit()
		queue_free()


func _on_death_timeout():
	queue_free()
