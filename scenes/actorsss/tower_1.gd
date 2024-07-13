extends Node2D

var proj: PackedScene = preload("res://scenes/actorsss/effects/attack_arrow.tscn")

var focus = null
var canAttack: bool = true
var parentNode = null
var fireInterval: float = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	parentNode = get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if focus != null:
#		look_at(focus.global_position)
		if canAttack:
			look_at(focus.global_position)
			parentNode.shooted(proj, position, rotation)
			canAttack = false
			if fireInterval > 0.1:
				fireInterval -= 0.025
				$CanAttacj.wait_time = fireInterval
			$CanAttacj.start()


func _on_area_2d_area_entered(area):
	focus = area


func _on_area_2d_area_exited(area):
	focus = null


func _on_can_attacj_timeout():
	canAttack = true
