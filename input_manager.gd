extends Node2D

@onready var main = $".."

func _unhandled_input(event):
	if event.is_action_pressed("inventory"):
		main.toggle_inventory_interface()
	if event.is_action_pressed("evolution"):
		main.toggle_evolution_interface()
