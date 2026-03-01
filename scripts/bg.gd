extends Node2D

func _ready():
	$AnimationPlayer.play("loop")

@warning_ignore("unused_parameter")
func _process(delta):
	if Global.game_over == true:
		$AnimationPlayer.pause()
