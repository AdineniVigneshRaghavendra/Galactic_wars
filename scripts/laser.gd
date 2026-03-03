extends CharacterBody2D

@export var speed = 900.0
@export var laser_type = 1
@export var laser: PackedScene

var y_direction = -1
var x_direction = 0
var shot = false

@warning_ignore("unused_parameter")
func _process(delta):
	if Global.game_over == true:
		return
	if laser_type == 1:
		velocity = Vector2(x_direction, y_direction) * speed
		move_and_slide()
	if laser_type == 2:
		velocity = Vector2(x_direction, y_direction) * speed
		move_and_slide()
		if shot == false:
			spawn_two_extra_laser()
	if laser_type == 3:
		pass

func spawn_two_extra_laser():
	var new_laser_r = laser.instantiate()
	var new_laser_l = laser.instantiate()
	var new_laser_m = laser.instantiate()
	
	
	add_child(new_laser_r)
	add_child(new_laser_l)
	add_child(new_laser_m)
	
	
	$Sprite2D.visible = false
	$Area2D/CollisionShape2D.disabled = true
	
	new_laser_r.speed = 600.0
	new_laser_r.x_direction = 1
	new_laser_r.y_direction = 0
	new_laser_r.global_position = $rPoint.global_position
	new_laser_r.global_rotation = $rPoint.global_rotation
	
	
	new_laser_l.speed = 600.0
	new_laser_l.x_direction = -1
	new_laser_l.y_direction = 0
	new_laser_l.global_position = $lPoint.global_position
	new_laser_l.global_rotation = $lPoint.global_rotation
	
	new_laser_m.speed = 0
	new_laser_m.x_direction = 1
	new_laser_m.y_direction = 0
	new_laser_m.global_position = global_position
	
	shot = true
	


func _on_timer_timeout():
	queue_free()
