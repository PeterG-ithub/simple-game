class_name InventoryData
extends Resource

signal inventory_interact(inventory_data: InventoryData, index, button)
signal inventory_updated(inventory_data: InventoryData)

@export var slot_datas: Array[SlotData]

func on_slot_clicked(index, button):
	inventory_interact.emit(self, index, button)

func select_item_data(index) -> ItemData:
	var item_data = slot_datas[index].item_data
	slot_datas[index].item_data = null
	inventory_updated.emit(self)
	return item_data

func drop_item_data(grabbed_item_data, index) -> ItemData:
	var item_data: ItemData
	if slot_datas[index].item_data:
		item_data = slot_datas[index].item_data
	slot_datas[index].item_data = grabbed_item_data
	inventory_updated.emit(self)
	return item_data
