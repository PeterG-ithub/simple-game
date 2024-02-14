extends PanelContainer

signal slot_clicked(index: int, button: int)

@export_enum("Inv", "Weapon", "Ring") var slot_type: String

@onready var texture_rect = $MarginContainer/TextureRect

func set_slot_data(slot_data: SlotData):
	texture_rect.texture = slot_data.item_data.texture

func set_item_data(item_data: ItemData):
	texture_rect.texture = item_data.texture

func reset_texture():
	texture_rect.texture = null

func _on_gui_input(event):
	if event is InputEventMouseButton \
			and event.pressed:
		slot_clicked.emit(get_index(), event.button_index)
