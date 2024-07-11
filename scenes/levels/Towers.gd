extends Node2D

signal attackerized(proj, locat, direc)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func shooted(proj, locat, direc):
	attackerized.emit(proj, locat, direc)
