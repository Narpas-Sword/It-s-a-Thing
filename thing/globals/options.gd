extends Control

#temp
const SAVE_PATH = "res://save.json"
const TICKRATE = 60
var settings = {}
var play_music = 1
var play_effects = 1
var new_choice = 1
var song
var menu = true




#saved

var Master_Mute = false
var Music_Mute = false
var Effects_Mute = false

var res_width = 1280
var res_height = 720
var fullscreen = false

var sp_use = 32
var sp_pause = 16777217



func _ready():
	var music_file = "res://music/Dee_Yan-Key_-_01_-_That_aint_Chopin.ogg"
	var stream = AudioStream.new()
	var music_player = AudioStreamPlayer.new()
	var effects_player = AudioStreamPlayer.new()
	if File.new().file_exists(music_file):
    	var music = load(music_file)
    	music_player.stream = music
    	music_player.play()
	#music bus
	var music_bus_id = AudioServer.get_bus_count()
	AudioServer.add_bus()
	AudioServer.set_bus_name(music_bus_id,"music")
	#effects bus
	var effects_bus_id = AudioServer.get_bus_count()
	AudioServer.add_bus()
	AudioServer.set_bus_name(effects_bus_id,"effects")
	# connects music/effects to master bus
	AudioServer.set_bus_send(music_bus_id,"Master")
	AudioServer.set_bus_send(effects_bus_id,"Master")
	

	add_child(music_player)
	music_player.bus = "music"
	add_child(effects_player)
	effects_player.bus = "effects"
	pass
	_save_game()
	#_load_game()
	_resolution()
	

  

func _process(delta):
	pass

func _resolution():

	ProjectSettings.set_setting("display/window/size/width", res_width)
	ProjectSettings.set_setting("display/window/size/width", res_height)
	OS.set_window_size(Vector2(res_width, res_height))

	if(fullscreen == true):
		OS.set_window_fullscreen(false)
		OS.set_window_fullscreen(true)
	elif(fullscreen == false):
		OS.set_window_fullscreen(true)
		OS.set_window_fullscreen(false)
		OS.set_window_position(Vector2(0,0))

func _save_game():
	var settings = {
		resolution = {
			width = res_width,
			height = res_height
		},
		fullscreen = fullscreen,
		

		sp_use = sp_use,
		sp_pause = sp_pause
	}

	var save_file = File.new()
	save_file.open(SAVE_PATH, File.WRITE)
	save_file.store_line(to_json(settings))
	save_file.close()
	pass

func _load_game():
	pass

func _choose_music():
	pass