extends VBoxContainer


func _ready():
	pass 


func _on_back_pressed():
	get_tree().change_scene("res://scenes/menu/Play_menu.tscn")


func _on_Character_3_pressed():
	get_tree().change_scene("res://scenes/player_move.tscn")


func _on_Character_2_pressed():
	get_tree().change_scene("res://scenes/player_move.tscn")

func _on_Character_1_pressed():
	get_tree().change_scene("res://scenes/player_move.tscn")
