extends PanelContainer

signal slot_clicked(index, button)

@onready var texture_rect = $MarginContainer/TextureRect

func set_slot_texture(evo_node: EvolutionNode):
	texture_rect.texture = evo_node.texture

func _on_gui_input(event):
	if event is InputEventMouseButton \
			and event.pressed:
		slot_clicked.emit(get_index(), event.button_index)
