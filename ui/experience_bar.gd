extends TextureProgressBar

@onready var player_variables: PlayerVariable = get_node("/root/PlayerVariable")
@onready var level_label = $LevelLabel

func _ready():
	max_value = player_variables.level_up_exp
	player_variables.leveled_up.connect(update_level_label)

func update_experience_bar():
	max_value = player_variables.level_up_exp
	value = player_variables.experience

func update_level_label():
	level_label.text = "Lv.%s" % player_variables.level
