extends Node

const LOOT_DROP = preload("res://item/collectible/loot_drop.tscn")

@onready var level_label = $UI/ExperienceBar/LevelLabel
@onready var experience_bar = $UI/ExperienceBar
@onready var player = $Player
@onready var player_variables = get_node("/root/PlayerVariable")
@onready var ui = $UI
@onready var enemy_dead_audio = $EnemyDeadAudio
@onready var player_dead_audio = $PlayerDeadAudio	
@onready var collectible = $Collectible
@onready var inventory_interface = $UI/InventoryInterface

func _ready():
	experience_bar.max_value = level_up_exp
	player.dead.connect(lose)
	inventory_interface.set_inventory_data(player_variables.player_inv_data)
	inventory_interface.set_equip_inventory_data(player_variables.equip_inv_data)

func _unhandled_input(event):
	if event.is_action_pressed("inventory"):
		toggle_inventory_interface()

func enemy_dead(enemy):
	enemy_dead_audio.play()
	exp += 20.0
	experience_bar.value = exp
	drop_loot(enemy.global_position)
	if exp >= level_up_exp:
		level_up()

func drop_loot(pos):
	var loot_drop = LOOT_DROP.instantiate()
	loot_drop.global_position = pos
	collectible.call_deferred("add_child", loot_drop)
	
func level_up():
	level += 1
	if level == 10:
		winner()
	
	level_up_exp = level_up_exp * 1.5
	exp = 0.0
	experience_bar.max_value = level_up_exp
	experience_bar.value = exp
	level_label.text = "Lv.%s" % level
	player_variables.damage_stat += 65

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
