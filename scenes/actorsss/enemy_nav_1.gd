extends NavActor
class_name NavEnemy

@export var hp = 5
@export var dmg = 1

func _process(delta):
	if target != null:
		var direction = to_local(navigation_agent.get_next_path_position()).normalized()
		velocity = direction * MAX_SPEED
		move_and_slide()

func _on_timer_timeout():
	create_path()

func hit(amt:int = 1):
	hp -= amt
	if hp <= 0:
		queue_free()

func set_damage(amt:int):
	dmg = amt

func _on_navigation_agent_2d_target_reached():
	parentNode.damage(dmg)
	queue_free()
