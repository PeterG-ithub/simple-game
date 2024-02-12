extends Control
@onready var button = $HBoxContainer/VBoxContainer/Button
const MAIN = preload("res://main.tscn")
func _on_button_pressed():
	var main = MAIN.instantiate()
	get_tree().root.add_child(main)

