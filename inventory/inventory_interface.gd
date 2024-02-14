extends Control

@export var inventory_data: InventoryData

var grabbed_item_data: ItemData

@onready var inventory:Inventory = $Inventory
@onready var grabbed_slot = $GrabbedSlot

func _ready():
	set_inventory_data(inventory_data)
	
func set_inventory_data(inventory_data: InventoryData):
	inventory.initialize_inventory(inventory_data)
	inventory_data.inventory_interact.connect(on_inventory_interacted)
	
func on_inventory_interacted(inventory_data: InventoryData, index, button):
	if grabbed_item_data: #if there is already grabbed item data
		grabbed_item_data = inventory_data.drop_item_data(grabbed_item_data, index)
		update_grabbed_slot(grabbed_item_data)
	else:
		grabbed_item_data = inventory_data.select_item_data(index)
		update_grabbed_slot(grabbed_item_data)
		
func update_grabbed_slot(grabbed_item_data):
	if grabbed_item_data:
		grabbed_slot.set_item_data(grabbed_item_data)
	else:
		grabbed_slot.reset_texture()
	
