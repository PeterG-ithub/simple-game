extends TextureProgressBar

@onready var player_variables: PlayerVariable = get_node("/root/PlayerVariable")

func update_experience_bar():
	max_value = player_variables.level_up_exp
	value = player_variables.experience
