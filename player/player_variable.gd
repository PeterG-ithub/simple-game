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

func _ready():
	max_health = PLAYER_DATA.max_health
	health = PLAYER_DATA.health
	speed = PLAYER_DATA.speed
	damage = PLAYER_DATA.damage
	player_inv_data = PLAYER_INV
	equip_inv_data = EQUIP_INV

