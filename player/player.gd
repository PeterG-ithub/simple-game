extends CharacterBody2D

const PROJECTILE = preload("res://projectile/projectile.tscn")
const MAX_HEALTH = 100.0

var health = 0.0

@onready var shooting_point = $ShootingPoint
@onready var health_bar = $HealthBar

func _ready():
	health = MAX_HEALTH
	health_bar.value = health

func _physics_process(delta):
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * 200
	move_and_collide(velocity * delta)

func _input(event):
	if event.is_action_pressed("shoot"):
		shoot()


func shoot():
	var projectile = PROJECTILE.instantiate()
	projectile.global_position = shooting_point.global_position
	projectile.global_rotation = shooting_point.global_position.direction_to(get_global_mouse_position()).angle()
	shooting_point.add_child(projectile)

func take_damage(damage):
	health -= damage
	health_bar.value = (health / MAX_HEALTH * 100)
	print("%s has taken %s damage" % [self, damage])
	if health <= 0:
		queue_free()
