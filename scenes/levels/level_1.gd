extends Node2D

var tower1Scene: PackedScene = preload("res://scenes/actorsss/tower_1.tscn")
var enemyScene: PackedScene = preload("res://scenes/actorsss/road_enemy.tscn")
var enemySceneBoss: PackedScene = preload("res://scenes/actorsss/road_boss.tscn")
var canUnit: bool = true
var hp: int = 100
var count = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("AddUnit") and canUnit:
		var pos = get_global_mouse_position()
		var tower = tower1Scene.instantiate() as Node2D
		tower.position = pos
		canUnit = false
		$Timer.start()
		$Actors/Towers.add_child(tower)


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
	gef.set_target($Target)
	gef.set_parent($Actors/Enemies)
	$Actors/Enemies.add_child(gef)
	$TimerSpawb.start()
	
func _on_timer_spawb_Boss_timeout():
	$Actors/Enemies.add_child(enemySceneBoss.instantiate())


func _on_enemies_damagerizer(amt):
	hp -= amt
	print(hp)
	if hp <= 0:
		get_tree().quit()

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
