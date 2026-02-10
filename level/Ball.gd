extends KinematicBody2D

var speed = 300
var velocity = Vector2.ZERO
var set_speed = 300
var speed_increase = 18
var only_once = true
var speed_increase_total = 0
var Level = get_parent()
var leftClock = 0
var rightClock = 0
var yellow_clock = 0
var purple_clock = 0
var collision_done
var gray_total
var gray_crank
var times = 0
var speed_check = false
var rng = RandomNumberGenerator.new()

var crightClock = 1
var cleftClock = 1

var white_ball_clock
var white_clock


func _ready():
		randomize()
		velocity.x = [ - 1, 1][randi() % 2]
		velocity.y = [ - 0.8, 0.8][randi() % 2]

func _physics_process(delta):
	var collision_object = move_and_collide(velocity * speed * delta)
	if collision_object:
		velocity = velocity.bounce(collision_object.normal)

		speed += speed_increase
		speed_increase_total += speed_increase
		collision_done = true



func stop_ball():
	speed = 0
	speed_increase_total = 0
	speed_check = false


func restart_ball():
	speed = set_speed
	velocity.x = [ - 1, 1][randi() % 2]
	velocity.y = [ - 0.8, 0.8][randi() % 2]
	yellow_clock = 1
	

func hide_all():
	var Level = get_parent()
	speed_check = false
	$BlackBall.visible = false
	$BlueBall.visible = false
	$BrownBall.visible = false
	$CyanBall.visible = false
	$GrayBall.visible = false
	$OrangeBall.visible = false
	$PinkBall.visible = false
	$PurpleBall.visible = false
	$RedBall.visible = false
	$YellowBall.visible = false
	$WhiteBall.visible = false
	$GreenBall.visible = false
	$MediumBall.disabled = true
	$BigBall.disabled = true
	$SmallBall.disabled = true
	Level.blue_ball = false
	Level.black_ball = false
	Level.red_ball = false
	Level.purple_ball = false
	Level.orange_ball = false
	Level.yellow_ball = false
	Level.brown_ball = false
	Level.cyan_ball = false
	Level.gray_ball = false
	Level.pink_ball = false
	Level.green_ball = false
	
func _process(delta):
	var Level = get_parent()
	var Player = get_parent().get_node("Player")

	if Input.is_action_pressed("ui_`") or white_ball_clock == 1:
		hide_all()
		$PurpleBall.visible = true
		$MediumBall.disabled = false
		if Level.ball_ready == true:
			set_speed = 300
			speed_increase = 18
		Level.purple_ball = true


	if Level.purple_ball == true:
		if Level.ball_ready == true:
			if speed_check == false:
				set_speed = 300
				speed_increase = 18
				speed_check = true
			purple_clock += 5.5 * delta
			speed = set_speed + speed_increase_total
			if purple_clock > 4:
				speed = 0
				if purple_clock > 5:
					purple_clock = 0



	if Input.is_action_pressed("ui_1") or Level.blue_ball == true or white_ball_clock == 2:
		hide_all()
		$BlueBall.visible = true
		$MediumBall.disabled = false
		if Level.ball_ready == true:
			set_speed = 300
			speed_increase = 18
			speed = set_speed + speed_increase_total
			if speed_check == false:
					set_speed = 300
					speed_increase = 18
					speed_check = true



	if Input.is_action_pressed("ui_2") or white_ball_clock == 3:
		hide_all()
		$BlackBall.visible = true
		$SmallBall.disabled = false
		Level.black_ball = true
		if Level.ball_ready == true:
			set_speed = 150
			speed_increase = 18

	if Level.black_ball == true:
		if Level.ball_ready == true:
			if speed_check == false:
				set_speed = 150
				speed_increase = 18
				speed_check = true
			speed = set_speed + speed_increase_total



	if Input.is_action_pressed("ui_3") or white_ball_clock == 4:
		hide_all()
		$BrownBall.visible = true
		$BigBall.disabled = false
		if Level.ball_ready == true:
			set_speed = 600
			speed_increase = 18
		Level.brown_ball = true

	if Level.brown_ball == true:
		if Level.ball_ready == true:
			speed = set_speed + speed_increase_total
			if speed_check == false:
				set_speed = 600
				speed_increase = 18
				speed_check = true



	if Input.is_action_pressed("ui_4") or white_ball_clock == 5:
		hide_all()
		$PinkBall.visible = true
		$MediumBall.disabled = false
		if Level.ball_ready == true:
			set_speed = 300
			speed_increase = 18
		Level.pink_ball = true

	if Level.pink_ball == true:
		if Level.ball_ready == true:
			if position.x < 640:
				velocity.x = [1, - 1][1]
				rightClock = 0
				leftClock += 0.025
				position.x += leftClock * (speed_increase_total * delta / 10) + 1
			if position.x >= 640:
				velocity.x = [ - 1, 1][1]
				leftClock = 0
				rightClock += 0.025
				position.x -= rightClock * (speed_increase_total * delta / 10) + 1
			speed = set_speed + speed_increase_total
			if speed_check == false:
					set_speed = 300
					speed_increase = 18
					speed_check = true



	if Input.is_action_pressed("ui_5") or white_ball_clock == 6:
		hide_all()
		$RedBall.visible = true
		$MediumBall.disabled = false
		Level.red_ball = true
		if Level.ball_ready == true:
			set_speed = 150
			speed_increase = 50

	if Level.red_ball == true:
		if Level.ball_ready == true:
			speed = set_speed + speed_increase_total
			if speed_check == false:
				set_speed = 150
				speed_increase = 50
				speed_check = true



	if Input.is_action_pressed("ui_6") or white_ball_clock == 7:
		hide_all()
		$CyanBall.visible = true
		$MediumBall.disabled = false
		Level.cyan_ball = true
		if Level.ball_ready == true:
			set_speed = 300
			speed_increase = 18
	
	if Level.cyan_ball == true:
		
		if Level.ball_ready == true:
			if position.x < Player.position.x:
				crightClock = 0
				cleftClock += 0.025
				position.x += leftClock * (speed_increase_total * delta - 100) + 1
			if position.x > Player.position.x:
				cleftClock = 0
				crightClock += 0.025
				position.x -= rightClock * (speed_increase_total * delta - 100) + 1
			speed = set_speed + speed_increase_total
			if speed_check == false:
				set_speed = 300
				speed_increase = 18
				speed_check = true



	if Input.is_action_pressed("ui_7") or white_ball_clock == 8:
		hide_all()
		$YellowBall.visible = true
		$MediumBall.disabled = false
		Level.yellow_ball = true
		if Level.ball_ready == true:
			set_speed = 300
			speed_increase = 18

	if Level.yellow_ball == true:
		if Level.ball_ready == true:
			yellow_clock += 0.2 * delta * 60
			speed_increase = 1 * yellow_clock
			speed = set_speed + speed_increase_total
		if Level.ball_ready == true:
			speed = set_speed + speed_increase_total
			if speed_check == false:
				set_speed = 100
				speed_increase = 0
				speed_check = true



	if Input.is_action_pressed("ui_8") or white_ball_clock == 9:
		hide_all()
		$GrayBall.visible = true
		$MediumBall.disabled = false
		Level.gray_ball = true
		if Level.ball_ready == true:
			set_speed = 200
			speed_increase = 18

	if Level.gray_ball == true:
		if Level.ball_ready == true:
			gray_total = set_speed + speed_increase_total
			gray_crank = gray_total / 20
			if collision_done == true:
				times += 1
				speed = gray_crank * times * delta * 60
				if speed > gray_total:
					collision_done = false
			if collision_done == false:
				speed = set_speed + speed_increase_total
				times = 0
		if Level.gray_ball == true:
			if Level.ball_ready == true:
				if speed_check == false:
					set_speed = 200
					speed_increase = 18
					speed_check = true


	
	if Input.is_action_pressed("ui_9") or white_ball_clock == 10:
		hide_all()
		$GreenBall.visible = true
		$MediumBall.disabled = false
		Level.green_ball = true
		if Level.ball_ready == true:
			set_speed = 300
			speed_increase = 18

	if Level.green_ball == true:
		if Level.ball_ready == true:
			speed = set_speed + speed_increase_total
			if white_ball_clock == 10:
				set_speed = 300
				speed_increase = 18
			if position.x > 943:
				position.x = 324

	if Input.is_action_pressed("ui_0") or white_ball_clock == 11:
		hide_all()
		$OrangeBall.visible = true
		$MediumBall.disabled = false
		Level.orange_ball = true
		if Level.ball_ready == true:
			set_speed = 3
			speed_increase = 3

	if Level.orange_ball == true:
		if Level.ball_ready == true:
			if white_ball_clock == 11:
				set_speed = 150
				speed_increase = 18
			speed = set_speed + speed_increase_total * delta * 60
			if set_speed < 1200:
				set_speed += 5
			if speed_check == false:
				set_speed = 3
				speed_increase = 3
				speed_check = true


	if Input.is_action_pressed("ui_-"):
		hide_all()
		$WhiteBall.visible = true
		$MediumBall.disabled = false
		white_ball_clock = 0
		white_clock = 0
		if Level.ball_ready == true:
			hide_all()
			white_clock = 0
			randomize()
			white_ball_clock = rng.randi_range(1, 11)
		Level.white_ball = true

	if Level.white_ball == true:
		if Level.ball_ready == true:
			if speed_check == false:
				set_speed = 300
				speed_increase = 18
				speed_check = true
			white_clock += 1 * delta * 60
			if white_clock > 300:
				hide_all()
				white_clock = 0
				randomize()
				white_ball_clock = rng.randi_range(1, 11)


	if Input.is_action_pressed("ui_`") or Input.is_action_pressed("ui_1") or Input.is_action_pressed("ui_2") or Input.is_action_pressed("ui_3") or Input.is_action_pressed("ui_4") or Input.is_action_pressed("ui_5") or Input.is_action_pressed("ui_6") or Input.is_action_pressed("ui_7") or Input.is_action_pressed("ui_8") or Input.is_action_pressed("ui_9") or Input.is_action_pressed("ui_0"):
		Level.white_ball = false
		white_ball_clock = 0
	
	if only_once:
		hide_all()
		$BlueBall.visible = true
		$MediumBall.disabled = false
		set_speed = 300
		yellow_clock = 1
		speed = set_speed + speed_increase_total
		speed_increase = 18
		only_once = false
		Level.white_ball = false

