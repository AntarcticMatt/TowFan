extends Area2D

var sped: int = 1000
var direction: Vector2 = Vector2.UP

func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += direction * sped * delta


func _on_death_timeout():
	queue_free()


func _on_body_entered(body):
	if "hit" in body:
		body.hit(5)
		queue_free()
