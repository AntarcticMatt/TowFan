extends NavActor
class_name NavEnemy

@export var hp = 5
@export var dmg = 1

func hit(amt:int = 1):
	hp -= amt
	if hp <= 0:
		queue_free()

func set_damage(amt:int):
	dmg = amt

func set_hp(amt:int):
	hp = amt

func _on_navigation_agent_2d_target_reached():
	parentNode.damage(dmg)
	queue_free()

