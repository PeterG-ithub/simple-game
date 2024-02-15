extends PanelContainer

signal slot_clicked(index, button)

@export var evolution_node: EvolutionNode

@onready var texture_rect = $MarginContainer/TextureRect

func initialize_slot():
	set_slot_texture(evolution_node)

func set_slot_texture(evo_node: EvolutionNode):
	texture_rect.texture = evo_node.texture

func _on_gui_input(event):
	if event is InputEventMouseButton \
			and event.pressed:
		slot_clicked.emit(get_index(), event.button_index)

