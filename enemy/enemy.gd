extends CharacterBody2D

@onready var player = $"../Player"


func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 50
	
	move_and_collide(velocity * delta) 
