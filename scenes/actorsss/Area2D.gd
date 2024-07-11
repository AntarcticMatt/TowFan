extends Area2D

signal deathNow

func hit():
	deathNow.emit()
