extends Node2D

var tower1Scene: PackedScene = preload("res://scenes/actorsss/tower_1.tscn")
var navTower: PackedScene = preload("res://scenes/actorsss/nav_tower.tscn")
var enemyScene: PackedScene = preload("res://scenes/actorsss/road_enemy.tscn")
var enemySceneBoss: PackedScene = preload("res://scenes/actorsss/road_boss.tscn")
var selected: Node2D = null
var canUnit: bool = true
var hp: int = 10000
var monies: int = 0
var count = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	handle_selector()
	handle_ui()
	if Input.is_action_just_pressed("AddUnit") and canUnit:
		var pos = get_global_mouse_position()
		var tower = navTower.instantiate() as Node2D
		tower.position = $Target.global_position
		tower.set_target(pos)
		tower.set_parent($Actors/Towers)
		canUnit = false
		$Timer.start()
		$Actors/Towers.add_child(tower)
	if Input.is_action_just_pressed("SpawnUnit"):
		handle_spawn(enemySceneBoss.instantiate())
	if Input.is_action_just_pressed("Select"):
		selected = $Selector.give_body()

func _on_timer_timeout():
	canUnit = true

func _on_timer_spawb_timeout():
	var gef = null
	if count >= 10:
		gef = enemySceneBoss.instantiate()
		count = 0
	else:
		gef = enemyScene.instantiate()
		count += 1
	handle_spawn(gef)

func handle_spawn(dude:Node2D):
	dude.set_target($Target.global_position)
	dude.set_parent($Actors/Enemies)
	$Actors/Enemies.add_child(dude)
	$TimerSpawb.start()

func handle_selector():
	$Selector.position = get_global_mouse_position()
	if(selected == null):
		$CamTarget/MovingCam/Panel.visible = false
	else:
		if(selected is NavEnemy):
			$CamTarget/MovingCam/Panel/HPFire.text = "HP: " + str(selected.hp)
			$CamTarget/MovingCam/Panel/Speed.text = "Speed: " + str(selected.get_speed())
		else:
			$CamTarget/MovingCam/Panel/HPFire.text = "Fire Rate: " + str(snapped(1 / selected.fireInterval, 0.1))
			$CamTarget/MovingCam/Panel/Speed.text = "Speed: " + str(selected.get_speed())
		$CamTarget/MovingCam/Panel.visible = true

func handle_ui():
	$CamTarget/MovingCam/HP.text = "HP: " + str(hp) + "\nMoney: " + str(monies)

func _on_enemies_damagerizer(amt):
	hp -= amt
	print(hp)
	if hp <= 0:
		get_tree().change_scene_to_file("res://scenes/levels/GameOver.tscn")

func _on_towers_attackerized(proj, locat, direc):
#	print("Laser from level")
	var laser = proj.instantiate()
	# 1. Update laser position
	laser.position = locat
	# 2. Move the laser (Done in laser script)
	laser.direction = Vector2.from_angle(direc)
	laser.rotation = direc
#	laser.rotation = $Player.rotation
	# 3. Sort the lasers to a projectile binder
	$Actors/Projectiles.add_child(laser)

func _on_enemies_moneyizer(value):
	monies += value
