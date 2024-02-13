class_name Inventory
extends PanelContainer

const SLOT = preload("res://inventory/slot.tscn")

@onready var item_grid = $MarginContainer/ItemGrid

func initialize_inventory(inventory_data: InventoryData):
	for index in inventory_data.slot_datas.size():
		if not inventory_data.slot_datas[index]: #If slot data empty
			var slot_data = SlotData.new() #create a new slot data
			inventory_data.slot_datas[index] = slot_data #insert new slot data to inventory
		var slot = SLOT.instantiate()	#Create slot ui
		slot.slot_clicked.connect(inventory_data.on_slot_clicked)
		item_grid.add_child(slot) # add slot ui to inventory
		
	update_item_grid(inventory_data)
	
func update_item_grid(inventory_data):
	var slot = item_grid.get_children()
	for index in inventory_data.slot_datas.size():
		if  inventory_data.slot_datas[index].item_data:
			slot[index].set_slot_data(inventory_data.slot_datas[index])
		else:
			slot[index].reset_texture()


