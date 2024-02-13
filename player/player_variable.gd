extends Node

const PLAYER_DATA = preload("res://player/new_player.tres")

var max_health: float
var health: float 
var speed: float 
var damage: float 

func _ready():
	max_health = PLAYER_DATA.max_health
	health = PLAYER_DATA.health
	speed = PLAYER_DATA.speed
	damage = PLAYER_DATA.damage
	PLAYER_DATA.damage = 100

