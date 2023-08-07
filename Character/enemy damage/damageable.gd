extends Node

@export var health : float = 20

func hit(damage : int):
	health -=damage
