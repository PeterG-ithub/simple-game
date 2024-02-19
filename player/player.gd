extends CharacterBody2D

signal dead

const PROJECTILE = preload("res://projectile/projectile.tscn")

@onready var player_variables: PlayerVariable = get_node("/root/PlayerVariable")
@onready var shooting_point = $ShootingPoint
@onready var health_bar = $HealthBar
@onready var player_shoot_audio = $PlayerShootAudio
@onready var damage_taken_audio = $DamageTakenAudio
@onready var sprite_2d = $Sprite2D

func _ready():
	health_bar.value = (player_variables.health / player_variables.max_health * 100)
	player_variables.evolved.connect(update_texture)

func _physics_process(delta):
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * player_variables.speed
	move_and_collide(velocity * delta)

func _input(event):
	if event.is_action_pressed("shoot"):
		shoot()

func update_texture():
	sprite_2d.texture = player_variables.texture

func shoot():
	var projectile = PROJECTILE.instantiate()
	projectile.global_position = shooting_point.global_position
	projectile.global_rotation = shooting_point.global_position.direction_to(get_global_mouse_position()).angle()
	shooting_point.add_child(projectile)
	player_shoot_audio.play()

func take_damage(damage):
	player_variables.health -= damage
	damage_taken_audio.play()
	health_bar.value = (player_variables.health / player_variables.max_health * 100)
	#print("%s has taken %s damage" % [self, damage])
	if player_variables.health <= 0:
		dead.emit()

func _on_attack_speed_timeout():
	shoot()

func _on_pickup_range_area_entered(area):
	player_variables.player_inv_data.pickup_item_data(area.item_data)
	area.queue_free()
