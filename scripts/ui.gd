extends Node2D



func _on_button_play_pressed():
	$CanvasLayer/startScreen.visible = false
	$CanvasLayer/chooseScreen.visible = true
	


func _on_button_ship_one_pressed():
	Global.chosen_ship = 1
	$CanvasLayer/chooseScreen/ships/shipOne.visible = true
	$CanvasLayer/chooseScreen/ships/shipTwo.visible = false
	$CanvasLayer/chooseScreen/ships/shipThree.visible = false
	
	


func _on_button_ship_two_pressed():
	Global.chosen_ship = 2
	$CanvasLayer/chooseScreen/ships/shipOne.visible = false
	$CanvasLayer/chooseScreen/ships/shipTwo.visible = true
	$CanvasLayer/chooseScreen/ships/shipThree.visible = false


func _on_button_ship_three_pressed():
	Global.chosen_ship = 3
	$CanvasLayer/chooseScreen/ships/shipOne.visible = false
	$CanvasLayer/chooseScreen/ships/shipTwo.visible = false
	$CanvasLayer/chooseScreen/ships/shipThree.visible = true


func _on_button_choose_pressed():
	Global.game_on = true
	$CanvasLayer/chooseScreen.visible = false
	$CanvasLayer/inGameScreen.visible = true
	$CanvasLayer/chooseScreen.queue_free()

func _on_button_mute_pressed():
	if Global.mute == false:
		Global.mute = true
		$CanvasLayer/inGameScreen/ButtonMute/LabelOn.visible = true
		$CanvasLayer/inGameScreen/ButtonMute/LabelOff.visible = false
	else:
		Global.mute = false
		$CanvasLayer/inGameScreen/ButtonMute/LabelOn.visible = false
		$CanvasLayer/inGameScreen/ButtonMute/LabelOff.visible = true


func _on_button_menu_pressed():
	Global.reset_values()
	get_tree().reload_current_scene()
	
@warning_ignore("unused_parameter")
func _process(delta):
	if Global.game_over == true:
		$CanvasLayer/inGameScreen.visible = false
		$CanvasLayer/gameOverScreen.visible = true
		$CanvasLayer/inGameScreen/LabelScore.text = str(Global.score)
		$CanvasLayer/gameOverScreen/LabelScore.text = "Score: " + str(Global.score)
