extends Node

const PLAYER_DATA = preload("res://player/new_player.tres")
const PLAYER_INV = preload("res://inventory/player_inv.tres")
const EQUIP_INV = preload("res://inventory/equip_inv.tres")

var max_health: float
var health: float 
var speed: float 
var damage: float 
var player_inv_data: InventoryData
var equip_inv_data: InventoryData

var _damage_placeholder: float
 
func _ready():
	max_health = PLAYER_DATA.max_health
	health = PLAYER_DATA.health
	speed = PLAYER_DATA.speed
	damage = PLAYER_DATA.damage
	_damage_placeholder = damage
	player_inv_data = PLAYER_INV
	equip_inv_data = EQUIP_INV

func update_damage():
	damage = _damage_placeholder + calculate_total_equip_damage()
	print(damage)

func calculate_total_equip_damage():
	var temp_damage = 0.0
	for slot_data in equip_inv_data.slot_datas:
		if slot_data.item_data:
			temp_damage += slot_data.item_data.damage
	return temp_damage
