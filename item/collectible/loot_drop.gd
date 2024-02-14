extends Area2D

const GRAY = Color8(130, 129, 129)
const GREEN = Color8(78, 217, 94)
const BLUE = Color8(28, 16, 232)
const PURPLE = Color8(131, 10, 207)
const YELLOW = Color8(255, 243, 13)

var loot_table_dict = {
		"Common": { "Color": GRAY, "Weight": 73.9 },
		"Uncommon": { "Color": GREEN, "Weight": 20.0 },
		"Rare": { "Color": BLUE, "Weight": 5.0 },
		"Epic": { "Color": PURPLE, "Weight": 1.0 },
		"Legendary": { "Color": YELLOW, "Weight": 0.1 },
}

func _ready():
	generate_random_loot_drop()

func generate_random_loot_drop():
	# Calculate total weight
	var total_weight = 0.0
	for loot_type in loot_table_dict.values():
		total_weight += loot_type["Weight"]
		
	var random_weight = randf() * total_weight
	
	var accumulated_weight = 0.0
	for loot_type in loot_table_dict.keys():
		accumulated_weight += loot_table_dict[loot_type]["Weight"]
		if random_weight < accumulated_weight:
			$ColorRect.color = loot_table_dict[loot_type]["Color"]
			break
