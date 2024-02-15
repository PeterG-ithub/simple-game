extends Node

const PLAYER_DATA = preload("res://player/new_player.tres")
const PLAYER_INV = preload("res://inventory/player_inv.tres")
const EQUIP_INV = preload("res://inventory/equip_inv.tres")

var max_health: float
var health: float 
var speed: float 
var damage: float
var damage_stat: float
var player_inv_data: InventoryData
var equip_inv_data: InventoryData

var experience: float
var level_up_exp: float
var level: int

func _ready():
	max_health = PLAYER_DATA.max_health
	health = PLAYER_DATA.health
	speed = PLAYER_DATA.speed
	damage = PLAYER_DATA.damage
	damage_stat = damage
	player_inv_data = PLAYER_INV
	equip_inv_data = EQUIP_INV
	
	experience = 0.0
	level_up_exp = 100.0
	level = 1

func update_damage():
	damage = damage_stat + calculate_total_equip_damage()
	print(damage)

func calculate_total_equip_damage():
	var temp_damage = 0.0
	for slot_data in equip_inv_data.slot_datas:
		if slot_data.item_data:
			temp_damage += slot_data.item_data.damage
	return temp_damage

func increase_exp(exp):
	experience += exp
	check_and_level_up()

func reset_exp():
	experience = 0.0

func increase_level_up_exp():
	level_up_exp *= 1.5

func can_level_up() -> bool:
	return experience >= level_up_exp

func level_up():
	level += 1

func check_and_level_up():
	if can_level_up():
		level_up()
		increase_level_up_exp()
		reset_exp()
