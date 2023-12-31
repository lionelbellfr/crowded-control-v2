extends Node

@onready var vp = get_tree().get_root()
@onready var base_size = Vector2i(1920, 1080)


func _ready():
		# Use whichever you would like by default
	#set_fullscreen()
	set_windowed()


func set_fullscreen():
	var window_size = DisplayServer.screen_get_size(DisplayServer.window_get_current_screen())
	
	if OS.get_name() == 'Windows' && window_size == base_size:
				# Not sure if this works outside of Windows / native resolution.
				#  - Mac didn't like it, nor smaller resolutions.
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	
	else:
		var scale = min(window_size.x / base_size.x, window_size.y / base_size.y)
		var scaled_size = (base_size * scale).round()
		
		var margins = Vector2(window_size.x - scaled_size.x, window_size.y - scaled_size.y)
		var screen_rect = Rect2((margins / 2).round(), scaled_size)
		
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		DisplayServer.window_set_position(DisplayServer.window_get_position())
		DisplayServer.window_set_size(Vector2(window_size.x, window_size.y + 1)) # Black magic?
		vp.set_size(scaled_size) # Not sure this is strictly necessary
		vp.set_attach_to_screen_rect(screen_rect)


func set_windowed():
	var window_size = DisplayServer.screen_get_size(DisplayServer.window_get_current_screen())
		# I set the windowed version to an arbitrary 80% of screen size here
	var scale = min(window_size.x / base_size.x, window_size.y / base_size.y) * 0.8
	var scaled_size = (base_size * scale).round()
	
	var window_x = (window_size.x / 2) - (scaled_size.x / 2)
	var window_y = (window_size.y / 2) - (scaled_size.y / 2)
	#OS.set_borderless_window(false)
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	DisplayServer.window_set_position(Vector2(window_x, window_y))
	DisplayServer.window_set_size(scaled_size)
	vp.set_size(scaled_size)
