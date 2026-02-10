extends Node

var PlayerScore = 0
var OpponentScore = 0
var Counter = 0
var only_once = true
var game_over = false
var win = false
var main_menu = true

func _on_Left_body_entered(body):
	Counter += 1
	score_achieved()
	OpponentScore += 1
	get_node("Player/Size1")
	get_node("Player/Size2")
	get_node("Player/Size3")
	get_node("Player/Size4")
	get_node("Player/Size5")
	get_node("Player/Size6")
	
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
		

	
		
	
		
	
func _on_Right_body_entered(body):
	score_achieved()
	PlayerScore += 1
	if PlayerScore == 6:
		win = true
	
func _process(delta):
	$PlayerScore.text = str(PlayerScore)
	$OpponentScore.text = str(OpponentScore)
	$CountdownLabel.text = str(int($CountdownTimer.time_left) + 1)
	
	if $Player.position.y < 678 and $Ball.position.y < 350:
		$Player.position.y += 1
	elif $Player.position.y > 680 and $Ball.position.y < 350:
		$Player.position.y -= 1
	
	if $Opponent.position.y < 40 and $Ball.position.y > 350:
		$Opponent.position.y += 1
	elif $Opponent.position.y > 42 and $Ball.position.y > 350:
		$Opponent.position.y -= 1
		
	if Counter == 0:
		$Player / Size6.visible = true
		$Player / Size6Collision.disabled = false
		$Player / Size5Collision.disabled = false
		$Player / Size4Collision.disabled = false
		$Player / Size3Collision.disabled = false
		$Player / Size2Collision.disabled = false
		$Player / Size1Collision.disabled = false
	if Counter == 1:
		$Player / Size6Collision.disabled = true
	if Counter == 2:
		$Player / Size5Collision.disabled = true
	if Counter == 3:
		$Player / Size4Collision.disabled = true
	if Counter == 4:
		$Player / Size3Collision.disabled = true
	if Counter == 5:
		$Player / Size2Collision.disabled = true
	
	if main_menu == true:
		$EnterPlay.visible = true
		$StartScreen.visible = true
		if Input.is_action_pressed("ui_accept"):
			main_menu = false
			$GrayBox.visible = false
			$TryAgain.visible = false
			$WhiteBox.visible = false
			$WinAgain.visible = false
			$YouWin.visible = false
			$HighRes.visible = false
			$HighResGlowing.visible = false
			$PlayerScore.visible = true
			$CountdownLabel.visible = true
			$OpponentScore.visible = true
			$EnterPlay.visible = false
			$StartScreen.visible = false
			Counter = 0
			PlayerScore = 0
			OpponentScore = 0
			game_over = false
			win = false
			score_achieved()
	
	
	if game_over == true:
		$GrayBox.visible = true
		$TryAgain.visible = true
		$PlayerScore.visible = false
		$CountdownLabel.visible = false
		$OpponentScore.visible = false
		if Input.is_action_pressed("ui_select"):
			main_menu = true
	
	if win == true:
		$WhiteBox.visible = true
		$WinAgain.visible = true
		$YouWin.visible = true
		$HighRes.visible = true
		$HighResGlowing.visible = true
		$PlayerScore.visible = false
		$CountdownLabel.visible = false
		$OpponentScore.visible = false
		if Input.is_action_pressed("ui_select"):
			main_menu = true
			
			
		
	
		
		
	
	if only_once:
		
		$GrayBox.visible = false
		$TryAgain.visible = false
		$PlayerScore.visible = true
		$CountdownLabel.visible = true
		$OpponentScore.visible = true
		$StartScreen.visible = true
		$EnterPlay.visible = true
		$WhiteBox.visible = false
		$WinAgain.visible = false
		$YouWin.visible = false
		$HighRes.visible = false
		$HighResGlowing.visible = false
		
		

		only_once = false


func _on_CountdownTimer_timeout():
	get_tree().call_group("BallGroup", "restart_ball")
	$CountdownLabel.visible = false


func score_achieved():
	if Counter < 6 and PlayerScore < 6 and main_menu == false:
		$Ball.position = Vector2(640, 360)
		get_tree().call_group("BallGroup", "stop_ball")
		$CountdownTimer.start()
		$CountdownLabel.visible = true
		$Clank.play()
		$Player.position.x = 640
		$Player.position.y = 680
		$Opponent.position.x = 640
		$Opponent.position.y = 41
	
