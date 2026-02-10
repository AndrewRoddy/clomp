extends Node

var PlayerScore = 0
var OpponentScore = 0
var Counter = 0
var only_once = true
var game_over = false
var win = false
var main_menu = true
var perk_select = false
var ball_ready

var black_ball
var white_ball
var blue_ball
var red_ball

var purple_ball
var orange_ball

var yellow_ball
var brown_ball
var cyan_ball

var gray_ball
var pink_ball
var green_ball

var pvp
var pvc
var gameselect

func _process(delta):

	$CountdownLabel.text = str(int($CountdownTimer.time_left) + 1)
	
	if Input.is_action_pressed("ui_r"):
		score_achieved()
		
	
	if $Player.position.y < 678 and $Ball.position.y < 350:
		$Player.position.y += 1
	elif $Player.position.y > 680 and $Ball.position.y < 350:
		$Player.position.y -= 1
	
	if $Opponent.position.y < 40 and $Ball.position.y > 350:
		$Opponent.position.y += 1
	elif $Opponent.position.y > 42 and $Ball.position.y > 350:
		$Opponent.position.y -= 1
	
	if $Player2.position.y < 40 and $Ball.position.y > 350:
		$Player2.position.y += 1
	elif $Player2.position.y > 42 and $Ball.position.y > 350:
		$Player2.position.y -= 1
	
	
		
	if Counter == 0:
		$Player / Size6.visible = true
		$Player / Size5Collision.disabled = true
		$Player / Size4Collision.disabled = true
		$Player / Size3Collision.disabled = true
		$Player / Size2Collision.disabled = true
		$Player / Size1Collision.disabled = true
		$Player / Size6Collision.disabled = false
	if Counter == 1:
		$Player / Size6Collision.disabled = true
		$Player / Size5Collision.disabled = false
	if Counter == 2:
		$Player / Size5Collision.disabled = true
		$Player / Size4Collision.disabled = false
	if Counter == 3:
		$Player / Size4Collision.disabled = true
		$Player / Size3Collision.disabled = false
	if Counter == 4:
		$Player / Size3Collision.disabled = true
		$Player / Size2Collision.disabled = false
	if Counter == 5:
		$Player / Size2Collision.disabled = true
		$Player / Size1Collision.disabled = false
	
	if pvp == true:
		if PlayerScore == 0:
			$Player2 / P2Size6.visible = true
			$Player2 / Collision1.disabled = true
			$Player2 / Collision2.disabled = true
			$Player2 / Collision3.disabled = true
			$Player2 / Collision4.disabled = true
			$Player2 / Collision5.disabled = true
			$Player2 / Collision6.disabled = false
		if PlayerScore == 1:
			$Player2 / Collision6.disabled = true
			$Player2 / Collision5.disabled = false
		if PlayerScore == 2:
			$Player2 / Collision5.disabled = true
			$Player2 / Collision4.disabled = false
		if PlayerScore == 3:
			$Player2 / Collision4.disabled = true
			$Player2 / Collision3.disabled = false
		if PlayerScore == 4:
			$Player2 / Collision3.disabled = true
			$Player2 / Collision2.disabled = false
		if PlayerScore == 5:
			$Player2 / Collision2.disabled = true
			$Player2 / Collision1.disabled = false
	
	if pvp == true:
		$Difficulty.visible = false
		$MoveWithLr.visible = true
		$MoveWithAd.visible = true
	if pvp == false:
		$Difficulty.visible = true
		$MoveWithLr.visible = false
		$MoveWithAd.visible = false
	
	if main_menu == true:
		if gameselect == false:
			$StartScreen / Clomps.visible = true
			$BackgroundStartScreenV2.visible = true
		$Player2Arm.visible = false
		$BadArms.visible = false
		$GrayBox.visible = false
		$TryAgain.visible = false
		$WhiteBox.visible = false
		$WinAgain.visible = false
		$YouWin.visible = false
		$HighRes.visible = false
		$HighResGlowing.visible = false
		$HighResP2.visible = false
		$HighResP2Glowing.visible = false
		$CountdownLabel.visible = true
		white_ball = false
		if Input.is_action_pressed("ui_accept"):
			blue_ball = true
			$StartScreen / Clomps.visible = false
			$BackgroundStartScreenV2.visible = false
			$GamemodeSelectMenu.visible = true
			gameselect = true
		if Input.is_action_pressed("ui_left") and gameselect == true:
			main_menu = false
			blue_ball = true
			$GamemodeSelectMenu.visible = false
			Counter = 0
			PlayerScore = 0
			OpponentScore = 0
			game_over = false
			win = false
			pvp = false
			pvc = true
			$BadArms.visible = true
			$Player2 / Collision1.disabled = true
			$Player2 / Collision2.disabled = true
			$Player2 / Collision3.disabled = true
			$Player2 / Collision4.disabled = true
			$Player2 / Collision5.disabled = true
			$Player2 / Collision6.disabled = true
			$Player2 / P2Size1.visible = false
			$Player2 / P2Size2.visible = false
			$Player2 / P2Size3.visible = false
			$Player2 / P2Size4.visible = false
			$Player2 / P2Size5.visible = false
			$Player2 / P2Size6.visible = false
			score_achieved()
			gameselect = false

		if pvp == true:
			if PlayerScore == 0:
				$Player2 / P2Size6.visible = true
				$Player2 / P2Size5.visible = false
				$Player2 / P2Size4.visible = false
				$Player2 / P2Size3.visible = false
				$Player2 / P2Size2.visible = false
				$Player2 / P2Size1.visible = false
			
		if Input.is_action_pressed("ui_right") and gameselect == true:
			main_menu = false
			$GamemodeSelectMenu.visible = false
			$Player2Arm.visible = true
			Counter = 0
			PlayerScore = 0
			OpponentScore = 0
			game_over = false
			win = false
			pvp = true
			pvc = false
			score_achieved()
			gameselect = false
	
			
	if game_over == true:
		$GrayBox.visible = true
		if pvp == false:
			$TryAgain.visible = true
		if pvp == true:
			$HighResP2.visible = true
			$HighResP2Glowing.visible = true
			$YouWin.visible = true
			$WinAgain.visible = true

		$CountdownLabel.visible = false

		
		$Ball.position = Vector2(640, 360)
		get_tree().call_group("BallGroup", "stop_ball")
		get_tree().call_group("ClompCenter", "ClompCenter")
		if Input.is_action_pressed("ui_select"):
			main_menu = true
			white_ball = false


	if Input.is_action_pressed("ui_backspace"):
		main_menu = true
	
	if win == true:
		$WhiteBox.visible = true
		$YouWin.visible = true

		$CountdownLabel.visible = false

		$WinAgain.visible = true
		$HighRes.visible = true
		$HighResGlowing.visible = true
		$Ball.position = Vector2(640, 360)
		get_tree().call_group("BallGroup", "stop_ball")
		white_ball = false
		if Input.is_action_pressed("ui_select"):
			main_menu = true
		
	if $Ball.position.y > 800:
		ball_out_bottom()
	
	if $Ball.position.y < - 50:
		ball_out_top()
		
	if only_once:
		blue_ball = true
		$GrayBox.visible = false
		$TryAgain.visible = false

		$CountdownLabel.visible = true

		$StartScreen / Clomps.visible = true
		$BackgroundStartScreenV2.visible = true
		$ListOfBalls.visible = true
		$WhiteBox.visible = false
		$WinAgain.visible = false
		$YouWin.visible = false
		$HighRes.visible = false
		$HighResGlowing.visible = false
		$HighResP2.visible = false
		$HighResP2Glowing.visible = false
		$Player2 / P2Size6.visible = false
		$Player2 / P2Size5.visible = false
		$Player2 / P2Size4.visible = false
		$Player2 / P2Size3.visible = false
		$Player2 / P2Size2.visible = false
		$Player2 / P2Size1.visible = false
			
		blue_ball = true
		only_once = false

func _on_CountdownTimer_timeout():
	get_tree().call_group("BallGroup", "restart_ball")
	$CountdownLabel.visible = false
	ball_ready = true

func score_achieved():
	if Counter < 6 and PlayerScore < 6 and main_menu == false:
		ball_ready = false
		$Ball.position = Vector2(640, 360)
		get_tree().call_group("BallGroup", "stop_ball")
		$CountdownTimer.start()
		$CountdownLabel.visible = true

		$Player.position.x = 640
		$Player.position.y = 680
		$Opponent.position.x = 640
		$Opponent.position.y = 41
		$Player2.position.x = 640
		$Player2.position.y = 41

func ball_out_bottom():
	Counter += 1
	score_achieved()
	OpponentScore += 1
	
	if Counter == 1:
		$Player / Size5.visible = true
		$Player / Size6.visible = false
		
	elif Counter == 2:
		$Player / Size4.visible = true
		$Player / Size5.visible = false
	
	elif Counter == 3:
		$Player / Size3.visible = true
		$Player / Size4.visible = false
	
	elif Counter == 4:
		$Player / Size2.visible = true
		$Player / Size3.visible = false
	
	elif Counter == 5:
		$Player / Size1.visible = true
		$Player / Size2.visible = false
	
	if Counter == 6:
		game_over = true
		
func ball_out_top():
	score_achieved()
	PlayerScore += 1
	if pvp == true:

		if PlayerScore == 1:
			$Player2 / P2Size5.visible = true
			$Player2 / P2Size6.visible = false
			
		elif PlayerScore == 2:
			$Player2 / P2Size4.visible = true
			$Player2 / P2Size5.visible = false
		
		elif PlayerScore == 3:
			$Player2 / P2Size3.visible = true
			$Player2 / P2Size4.visible = false
		
		elif PlayerScore == 4:
			$Player2 / P2Size2.visible = true
			$Player2 / P2Size3.visible = false
		
		elif PlayerScore == 5:
			$Player2 / P2Size1.visible = true
			$Player2 / P2Size2.visible = false
	
	if PlayerScore == 6:
		win = true

