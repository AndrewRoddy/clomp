extends VideoPlayer
func _process(delta):
	var isPlaying = is_playing()
	if isPlaying == false:
		play()

	pass

func _ready():
	
	
	set_process(true)


	set_autoplay(true)
