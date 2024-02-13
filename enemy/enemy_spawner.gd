extends Node2D


const MAX_ENEMY_COUNT = 10
const ENEMY = preload("res://enemy/enemy.tscn")

@onready var main = $".."
@onready var path_follow_2d = $Path2D/PathFollow2D

func spawn_enemy():
	var enemy = ENEMY.instantiate()
	enemy.died.connect(main.enemy_dead)
	path_follow_2d.progress_ratio = randf()
	enemy.global_position = path_follow_2d.global_position
	add_child(enemy)

func _on_spawn_timer_timeout():
	spawn_enemy()
