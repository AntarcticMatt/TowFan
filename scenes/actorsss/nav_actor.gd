extends CharacterBody2D
class_name NavActor

@export var MAX_SPEED = 150
@export var target: Vector2

@onready var navigation_agent := $NavigationAgent2D as NavigationAgent2D

var parentNode: Node = null

func _process(delta):
	mover(delta)

func mover(delta):
	if target != null:
		var direction = to_local(navigation_agent.get_next_path_position()).normalized()
		velocity = direction * MAX_SPEED
		move_and_slide()

func create_path():
	navigation_agent.target_position = target

func set_target(nodee:Vector2):
	target = nodee

func set_speed(amt:int):
	MAX_SPEED = amt

func get_speed() -> int:
	return MAX_SPEED

func set_parent(nod:Node2D):
	parentNode = nod

func _on_navigation_agent_2d_target_reached():
	target = self.position

func _on_pather_timeout():
	create_path()
