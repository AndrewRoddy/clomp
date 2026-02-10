extends Node2D

func _process(delta):
	var Level = get_parent()
	if Level.main_menu == true:
		$HpText.visible = false
		$Health6.visible = false
		$Health5.visible = false
		$Health4.visible = false
		$Health3.visible = false
		$Health2.visible = false
		$Health1.visible = false
		$Health0.visible = false
		$OpHpText.visible = false
		$OpHealth6.visible = false
		$OpHealth5.visible = false
		$OpHealth4.visible = false
		$OpHealth3.visible = false
		$OpHealth2.visible = false
		$OpHealth1.visible = false
		$OpHealth0.visible = false
		
		
		
	if Level.main_menu == false:
		if Level.Counter == 0:
			$HpText.visible = true
			$Health6.visible = true
			$Health5.visible = false
			$Health4.visible = false
			$Health3.visible = false
			$Health2.visible = false
			$Health1.visible = false
			$Health0.visible = false
		if Level.Counter == 1:
			$Health5.visible = true
			$Health6.visible = false
		if Level.Counter == 2:
			$Health4.visible = true
			$Health5.visible = false
		if Level.Counter == 3:
			$Health3.visible = true
			$Health4.visible = false
		if Level.Counter == 4:
			$Health2.visible = true
			$Health3.visible = false
		if Level.Counter == 5:
			$Health1.visible = true
			$Health2.visible = false
		if Level.Counter == 6:
			$Health0.visible = true
			$Health1.visible = false
		
		
		
		
		
		if Level.PlayerScore == 0:
			$OpHpText.visible = true
			$OpHealth6.visible = true
			$OpHealth5.visible = false
			$OpHealth4.visible = false
			$OpHealth3.visible = false
			$OpHealth2.visible = false
			$OpHealth1.visible = false
			$OpHealth0.visible = false
		if Level.PlayerScore == 1:
			$OpHealth5.visible = true
			$OpHealth6.visible = false
		if Level.PlayerScore == 2:
			$OpHealth4.visible = true
			$OpHealth5.visible = false
		if Level.PlayerScore == 3:
			$OpHealth3.visible = true
			$OpHealth4.visible = false
		if Level.PlayerScore == 4:
			$OpHealth2.visible = true
			$OpHealth3.visible = false
		if Level.PlayerScore == 5:
			$OpHealth1.visible = true
			$OpHealth2.visible = false
		if Level.PlayerScore == 6:
			$OpHealth0.visible = true
			$OpHealth1.visible = false
		
