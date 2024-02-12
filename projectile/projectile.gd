extends Area2D

const MAX_RANGE = 200
var range = 0

func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	position += delta * direction * 100
	range += 100 * delta
	if range > MAX_RANGE:
		queue_free()
	

func _on_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(100)
		queue_free()
