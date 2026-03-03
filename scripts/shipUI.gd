extends Sprite2D

@export var laser: PackedScene




func _on_timer_timeout():
	var new_laser = laser.instantiate()
	add_child(new_laser)
	new_laser.global_position = $point.global_position
