extends Area2D

signal deathNow

func hit(_amt):
	deathNow.emit()
