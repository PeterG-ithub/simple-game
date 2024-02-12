extends CharacterBody2D

const PROJECTILE = preload("res://projectile/projectile.tscn")
@onready var shooting_point = $ShootingPoint

func _physics_process(delta):
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * 200
	
	move_and_collide(velocity * delta)

func _input(event):
	
	if event.is_action_pressed("shoot"):
		shoot()


func shoot():
	var projectile = PROJECTILE.instantiate()
	projectile.global_position = global_position
	shooting_point.add_child(projectile)
	print("shoot")
