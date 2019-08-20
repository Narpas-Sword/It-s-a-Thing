extends VBoxContainer


func _on_Options_pressed():
	get_tree().change_scene("res://scenes/menu/Options_Menu.tscn")


func _on_Exit_pressed():
	get_tree().quit()


func _on_Play_pressed():
	get_tree().change_scene("res://scenes/menu/Play_menu.tscn")
