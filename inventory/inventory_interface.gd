extends Control

@export var inventory_data: InventoryData

@onready var inventory:Inventory = $Inventory

func _ready():
	set_inventory_data(inventory_data)

func set_inventory_data(inventory_data: InventoryData):
	inventory.initialize_inventory(inventory_data)

