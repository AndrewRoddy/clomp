extends KinematicBody2D

var speed = 650
var ball

func _ready():
	ball = get_parent().find_node("Ball")
	var Level = get_parent()



	
func _physics_process(delta):
	var Level = get_parent()
	if Level.pvc == true:
		move_and_slide(Vector2(get_opponent_direction(), 0) * speed)
	
func get_opponent_direction():
	var Level = get_parent()
	if Level.pvc == true:
		if abs(ball.position.x - position.x) > 25:
			if ball.position.x > position.x: return 1
			else: return - 1
		else: return 0

func _process(delta):
	var Level = get_parent()
	if Level.pvc == false:
		$BadGuy.visible = false
		$CollisionShape2D.disabled = true
	if Level.pvc == true:
		$BadGuy.visible = true
		$CollisionShape2D.disabled = false
	
	if Input.is_action_pressed("ui_v"):
		speed = 400
	if Input.is_action_pressed("ui_b"):
		speed = 650
	if Input.is_action_pressed("ui_n"):
		speed = 900
	if Input.is_action_pressed("ui_m"):
		speed = 3000
