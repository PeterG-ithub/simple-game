class_name InventoryData
extends Resource

@export var slot_datas: Array[SlotData]

func on_slot_clicked(index, button):
	print("%s %s %s" % [self, index, button])


