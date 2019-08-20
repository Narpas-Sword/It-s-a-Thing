extends Control


func _ready():
	$Audio.connect("pressed", self, "Audio")
	$Video.connect("pressed", self, "Video")
	$input.connect("pressed", self, "input")
	$ctrl_video/btn_resolution.connect("item_selected", self, "Resolution")
	$ctrl_video/btn_fullscreen.connect("item_selected", self, "Fullscreen")
	$ctrl_audio/btn_master_mute.connect("pressed", self, "Mute_Master")
	$ctrl_audio/master_slider.connect("value_changed", self, "Master_Volume")
	$ctrl_audio/btn_music_mute.connect("pressed", self, "Mute_Music")
	$ctrl_audio/music_slider.connect("value_changed", self, "Music_Volume")
	$ctrl_audio/btn_effects_mute.connect("pressed", self, "Mute_Effects")
	$ctrl_audio/effects_slider.connect("value_changed", self, "Effects_Volume")
	
	$ctrl_video/btn_resolution.add_item("800x600", 0)
	$ctrl_video/btn_resolution.add_item("1280x720", 1)
	$ctrl_video/btn_resolution.add_item("1920x1080", 2)
	
	if(options.res_width == 800 and options.res_height == 600):
		$ctrl_video/btn_resolution.select(0)
	elif(options.res_width == 1280 and options.res_height == 720):
		$ctrl_video/btn_resolution.select(1)
	elif(options.res_width == 1920 and options.res_height == 1080):
		$ctrl_video/btn_resolution.select(2)
	pass
	
	$ctrl_video/btn_fullscreen.add_item("Fullscreen", 0)
	$ctrl_video/btn_fullscreen.add_item("Windowed", 1)
	
	if(options.fullscreen == true):
		$ctrl_video/btn_fullscreen.select(0)
	elif(options.fullscreen == false):
		$ctrl_video/btn_fullscreen.select(1)
		

#buttons
func Video():
	$ctrl_video.show()
	$ctrl_audio.hide()
	$ctrl_input.hide()
	pass

func Audio():
	$ctrl_video.hide()
	$ctrl_audio.show()
	$ctrl_input.hide()
	pass

func input():
	$ctrl_video.hide()
	$ctrl_audio.hide()
	$ctrl_input.show()
	pass

#used a different thing to connect this, it can be changed but it works for now
func _on_Back_pressed():
	get_tree().change_scene("res://scenes/menu/main menu.tscn")


#video stuff
func Resolution(item):
	match item:
		0:
			options.res_width = 800
			options.res_height = 600
			options._resolution()
			options._save_game()
		1:
			options.res_width = 1280
			options.res_height = 720
			options._resolution()
			options._save_game()
		2:
			options.res_width = 1920
			options.res_height = 1080
			options._resolution()
			options._save_game()
		
	
	pass

func Fullscreen(item):
	match item:
		0:
			options.fullscreen = true
			options._resolution()
			options._save_game()
		1:
			options.fullscreen = false
			options._resolution()
			options._save_game()
	pass

#audio stuff
func Mute_Master():
	if(options.Master_Mute == false):
		options.Master_Mute = true
	elif(options.Master_Mute == true):
		options.Master_Mute = false
	options._choose_music()
	options._save_game()
	pass

func Master_Volume(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)
func Effects_Volume(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("effects"), value)
func Music_Volume(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("music"), value)
	
func Mute_Music():
	if(options.Music_Mute == false):
		options.Music_Mute = true
	elif(options.Music_Mute == true):
		options.Music_Mute = false
	options._choose_music()
	options._save_game()
	pass

func Mute_Effects():
	if(options.Effects_Mute == false):
		options.Effects_Mute = true
	elif(options.Effects_Mute == true):
		options.Effects_Mute = false
	options._choose_music()
	options._save_game()
	pass
