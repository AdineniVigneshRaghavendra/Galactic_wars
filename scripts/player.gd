extends CharacterBody2D

@export var speed = 800.0
@export var stopping_distance = 0.0
@export var health = 3

var destroyed = false

var laser_one = preload("res://components/laser_one.tscn")
var laser_two = preload("res://components/laser_two.tscn")
var laser_three = preload("res://components/laser_three.tscn")

var can_shoot = true
var power_up_boost = 0

func _ready():
	$AnimationPlayerBoom.play("idle")
	$AnimationPlayerPowerUp.play("idle")
	$AnimationPlayerHurt.play("idle")

@warning_ignore("unused_parameter")
func _process(delta):
	if Global.game_on ==  true and Global.game_over == false:
		turn_on_ship_body()
		visible = true
		if Input.is_action_pressed("left_click"):
			var mouse_position = get_global_mouse_position()
			var distance_to_mouse = global_position.distance_to(mouse_position)
			if distance_to_mouse > stopping_distance:
				var direction = (mouse_position - global_position).normalized()
				velocity = direction * speed
			else:
				velocity = Vector2.ZERO
			move_and_slide()
			if can_shoot == true:
				shoot_laser()
	if health <= 0 and destroyed == false:
		Global.game_over = true
		speed = 0
		$ships.visible = false
		$AudioStreamPlayer2DGameOver.play()
		$AnimationPlayerBoom.play("boom")
		destroyed = true

func turn_on_ship_body():
	if Global.chosen_ship == 1:
		$ships/ship1.visible = true
	if Global.chosen_ship == 2:
		$ships/ship2.visible = true
	if Global.chosen_ship == 3:
		$ships/ship3.visible = true

func shoot_laser():
	var new_laser
	if Global.chosen_ship == 1:
		new_laser = laser_one.instantiate()
		add_sibling(new_laser)
		$TimerToShoot.wait_time = 0.5 - power_up_boost
	if Global.chosen_ship == 2:
		new_laser = laser_two.instantiate()
		add_sibling(new_laser)
		$TimerToShoot.wait_time = 0.8 - power_up_boost
	if Global.chosen_ship == 3:
		new_laser = laser_three.instantiate()
		add_child(new_laser)
		$TimerToShoot.wait_time = 1.5 - power_up_boost
	new_laser.global_position = $point.global_position
	can_shoot = false
	$AudioStreamPlayer2DLaser.play()
	$TimerToShoot.start()



func _on_area_2d_area_entered(area):
	if area.is_in_group("enemy"):
		$AnimationPlayerHurt.play("hurt")
		health -= 1
		if health >= 1:
			$AudioStreamPlayer2DHit.play()
		_on_timer_power_up_timeout()
	if area.is_in_group("powerUp"):
		area.get_parent().queue_free()
		power_up_boost = 0.4
		$AnimationPlayerPowerUp.play("power")
		$TimerPowerUp.start()

func _on_timer_power_up_timeout():
	power_up_boost = 0
	$AnimationPlayerPowerUp.play("idle")
	
	


func _on_timer_to_shoot_timeout():
	can_shoot = true
