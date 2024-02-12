extends CharacterBody2D

@onready var player = $"../Player"

var health = 100

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 50
	
	move_and_collide(velocity * delta) 

func take_damage(damage):
	health -= damage
	print("%s has taken %s damage" % [self, damage])
	if health <= 0:
		queue_free()
