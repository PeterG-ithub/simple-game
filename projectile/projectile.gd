extends Area2D

const MAX_RANGE = 200
var range = 0
var damage = 100.0

@onready var player_variables = get_node("/root/PlayerVariable")

func _ready():
	damage += player_variables.damage
	print(damage)
	
func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	position += delta * direction * 250
	range += 100 * delta
	if range > MAX_RANGE:
		queue_free()
	

func _on_body_entered(body):
	if body.has_method("take_damage"):
		
		body.take_damage(damage)
		queue_free()
