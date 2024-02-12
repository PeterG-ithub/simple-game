extends Node

var exp = 0.0
var level_up_exp = 100.0

@onready var experience_bar = $UI/ExperienceBar

func _ready():
	experience_bar.max_value = level_up_exp
	

func enemy_dead():
	print("enemy dead")
	exp += 20.0
	print(exp)
	experience_bar.value = exp
	

	
