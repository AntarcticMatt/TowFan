extends NavActor
class_name NavEnemy

@export var hp: int = 5
@export var dmgReduction: int = 0
@export var dmg: int = 1
@export var value: int = 0


func hit(amt:int = 1):
	hp -= max(amt - dmgReduction, 0)
	if hp <= 0:
		parentNode.cash_out(value)
		queue_free()

func set_damage(amt:int):
	dmg = amt

func set_hp(amt:int):
	hp = amt

func _on_navigation_agent_2d_target_reached():
	parentNode.damage(dmg)
	queue_free()

