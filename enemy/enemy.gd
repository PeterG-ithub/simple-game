extends CharacterBody2D

signal died

const MAX_HEALTH = 1000.0

var health

@onready var player = $"../Player"
@onready var health_bar = $HealthBar
@onready var attack_cooldown = $AttackCooldown
@onready var hitbox = $Hitbox

func _ready():
	health = MAX_HEALTH
	health_bar.value = health
	
func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 50
	move_and_collide(velocity * delta) 

func take_damage(damage):
	health -= damage
	health_bar.value = (health / MAX_HEALTH * 100)
	print("%s has taken %s damage" % [self, damage])
	if health <= 0:
		died.emit()
		queue_free()



func _on_hitbox_body_entered(body):
	if attack_cooldown.is_stopped():
		if body.has_method("take_damage"):
			body.take_damage(10)
		attack_cooldown.start()
		
