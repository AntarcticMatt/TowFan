extends Node2D

signal damagerizer(amt)
signal moneyizer(value)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func damage(amount):
	damagerizer.emit(amount)
	print(amount)

func cash_out(val: int):
	moneyizer.emit(val)
