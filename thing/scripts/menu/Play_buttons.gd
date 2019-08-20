extends Control

func ready():
	pass
	

func _on_New_Game_pressed():
	get_tree().change_scene("res://scenes/menu/Character_select.tscn")


func _on_Load_pressed():
	pass # Replace with function body.


func _on_Back_pressed():
	get_tree().change_scene("res://scenes/menu/main menu.tscn")
