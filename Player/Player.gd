extends KinematicBody2D

var speed = 500
var counter = 0

func _physics_process(delta):
	var Level = get_parent()
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	
	if Level.pvp == false:
		if Input.is_action_pressed("ui_left") == false:
			if Input.is_action_pressed("ui_right") == false:
				if Input.is_action_pressed("ui_a"):
					velocity.x -= 1
					
		if Input.is_action_pressed("ui_left") == false:
			if Input.is_action_pressed("ui_right") == false:
				if Input.is_action_pressed("ui_d"):
					velocity.x += 1
					
	move_and_slide(velocity * speed)
	
	

