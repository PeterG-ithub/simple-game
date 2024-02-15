extends PanelContainer

@onready var texture_rect = $MarginContainer/TextureRect

func set_slot_texture(evo_node: EvolutionNode):
	texture_rect.texture = evo_node.texture
