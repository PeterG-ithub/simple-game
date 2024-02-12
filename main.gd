extends Node

var exp = 0.0
var level_up_exp = 100.0
var level = 1

@onready var level_label = $UI/ExperienceBar/LevelLabel
@onready var experience_bar = $UI/ExperienceBar
@onready var player = $Player
@onready var ui = $UI

func _ready():
	experience_bar.max_value = level_up_exp

func enemy_dead():
	exp += 20.0
	experience_bar.value = exp
	if exp >= level_up_exp:
		level_up()
func level_up():
	print("level up")
	level += 1
	if level == 2:
		print("winner")
		winner()
	level_up_exp = level_up_exp * 1.5
	exp = 0.0
	experience_bar.max_value = level_up_exp
	experience_bar.value = exp
	level_label.text = "Lv.%s" % level
	player.damage_stat += 50



func winner():
	var win_scene = preload("res://ui/winner.tscn")
	ui.add_child(win_scene.instantiate())
	get_tree().paused = true
