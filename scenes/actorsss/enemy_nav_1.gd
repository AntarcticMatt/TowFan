extends CharacterBody2D
class_name NavActor

@export var MAX_SPEED = 150
@export var target: Node2D
@export var hp = 5
@export var dmg = 1

@onready var navigation_agent := $NavigationAgent2D as NavigationAgent2D

var parentNode: Node = null

func _ready():
	parentNode = get_parent()

func _process(delta):
	var direction = to_local(navigation_agent.get_next_path_position()).normalized()
	velocity = direction * MAX_SPEED
	move_and_slide()

func create_path():
	navigation_agent.target_position = target.global_position

func _on_timer_timeout():
	create_path()

func hit(amt:int = 1):
	hp -= amt
	if hp <= 0:
		queue_free()

func set_target(nodee):
	target = nodee

func set_damage(amt:int):
	dmg = amt

func set_speed(amt:int):
	MAX_SPEED = amt

func set_parent(nod:Node2D):
	parentNode = nod

func _on_navigation_agent_2d_target_reached():
	parentNode.damage(dmg)
	queue_free()
