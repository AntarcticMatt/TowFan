extends NavEnemy

@onready var navFas := $NavigationAgent2D as NavigationAgent2D
@onready var navSlo := $NavSlow as NavigationAgent2D
@export var disFas := 0 as float
@export var disSlo := 0 as float


func _process(delta):
	mover(delta)


func create_path():
	navFas.target_position = target
	navSlo.target_position = target
	whichPath()


func whichPath():
	disFas = navFas.get_next_path_position()
	disSlo = navSlo.distance_to_target()	
	if disFas > (disSlo * 1.2):
		navigation_agent = navSlo
	else:
		navigation_agent = navFas
