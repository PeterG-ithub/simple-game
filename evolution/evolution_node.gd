class_name EvolutionNode
extends Resource

signal can_evolve(evo_node)

@export var name: String
@export var texture: Texture
@export var next_evo: EvolutionNode
@export var evo_req: Dictionary

func check_evo_requirement(player_evolution: PlayerVariable):
	if evo_req:
		if evo_req["level"] == player_evolution.level \
				and evo_req["last_evo"] == player_evolution.current_evolution:
			print("can evolve")
			can_evolve.emit(self)
		else:
			print("can NOT evolve yet")
