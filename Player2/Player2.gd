extends KinematicBody2D

var speed = 500
var counter = 0

func _physics_process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_a"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_d"):
		velocity.x += 1
	move_and_slide(velocity * speed)
