extends Control

@export var evo_tree: EvolutionTree

@onready var evo_slots = $MarginContainer/PanelContainer/NinePatchRect/EvoSlots

func _ready():
	initialize_interface(evo_tree)

func initialize_interface(evolution_tree: EvolutionTree):
	var current_node = evo_tree.starting_node
	var slots = evo_slots.get_children()
	for index in range(3): 
		slots[index].set_slot_texture(current_node)
		if current_node.next_evo:
			current_node = current_node.next_evo
