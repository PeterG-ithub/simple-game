extends Node

const LOOT_DROP = preload("res://item/collectible/loot_drop.tscn")

@onready var level_label = $UI/ExperienceBar/LevelLabel
@onready var experience_bar = $UI/ExperienceBar
@onready var player = $Player
@onready var player_variables: PlayerVariable = get_node("/root/PlayerVariable")
@onready var ui = $UI
@onready var enemy_dead_audio = $EnemyDeadAudio
@onready var player_dead_audio = $PlayerDeadAudio	
@onready var collectible = $Collectible
@onready var inventory_interface = $UI/InventoryInterface
@onready var evo_ui = $UI/EvoUI

func _ready():
	player.dead.connect(lose)
	inventory_interface.set_inventory_data(player_variables.player_inv_data)
	inventory_interface.set_equip_inventory_data(player_variables.equip_inv_data)

func enemy_dead(enemy):
	enemy_dead_audio.play()
	var enemy_exp = 20.0
	player_variables.increase_exp(enemy_exp)
	experience_bar.update_experience_bar()
	drop_loot(enemy.global_position)

func drop_loot(pos):
	var loot_drop = LOOT_DROP.instantiate()
	loot_drop.global_position = pos
	collectible.call_deferred("add_child", loot_drop)

func winner():
	var win_scene = preload("res://ui/winner.tscn")
	ui.add_child(win_scene.instantiate())
	get_tree().paused = true

func lose():
	player_dead_audio.play()
	const LOSE = preload("res://ui/lose.tscn")
	ui.add_child(LOSE.instantiate())
	get_tree().paused = true

func toggle_inventory_interface():
	inventory_interface.visible = not inventory_interface.visible
	toggle_pause()

func toggle_evolution_interface():
	evo_ui.visible = not evo_ui.visible
	toggle_pause()

func toggle_pause():
	get_tree().paused = not get_tree().paused
