class_name InventoryEquip
extends Inventory

@onready var player_variables = get_node("/root/PlayerVariable")

func update_item_grid(inventory_data):
	player_variables.update_damage()
	super.update_item_grid(inventory_data)
