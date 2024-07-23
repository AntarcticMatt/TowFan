extends NavActor

var proj: PackedScene = preload("res://scenes/actorsss/effects/attack_arrow.tscn")

var focus = null
var canAttack: bool = true

@export var fireInterval: float = 1
@export var rampedInterval: float = 0.05

func _process(delta):
	mover(delta)
	attackProcess()

func attackProcess():
	if focus != null:
		if canAttack:
			parentNode.shooted(proj, position, get_angle_to(focus.global_position))
			canAttack = false
			$AudioStreamPlayer2D.play()
			if fireInterval > rampedInterval:
				fireInterval -= 0.025
				$CanAttack.wait_time = fireInterval
			$CanAttack.start()
	else:
		if $Area2D.get_overlapping_bodies().is_empty() == false:
			focus = $Area2D.get_overlapping_bodies()[0]

func _on_can_attack_timeout():
	canAttack = true
