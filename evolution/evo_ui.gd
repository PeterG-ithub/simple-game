extends Control

@export var evo_tree: EvolutionTree

@onready var evo_slots = $MarginContainer/PanelContainer/NinePatchRect/EvoSlots
@onready var player_variables: PlayerVariable = get_node("/root/PlayerVariable")

func _ready():
	initialize_interface(evo_tree)

func initialize_interface(evolution_tree: EvolutionTree):
	var current_node = evo_tree.starting_node
	player_variables.current_evolution = current_node.name
	var slots = evo_slots.get_children()
	for index in range(3): 
		slots[index].evolution_node = current_node
		slots[index].evolution_node.can_evolve.connect(player_variables.evolve)
		slots[index].initialize_slot()
		slots[index].slot_clicked.connect(on_slot_clicked)
		if current_node.next_evo:
			current_node = current_node.next_evo
	
func on_slot_clicked(index, button):
	var slots = evo_slots.get_children()
	slots[index].evolution_node.check_evo_requirement(player_variables)
	#print(slots[index].evolution_node.name)
	#print("%s %s" % [index, button])
