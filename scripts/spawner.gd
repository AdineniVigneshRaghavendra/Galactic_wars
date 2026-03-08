extends Node2D

@onready var enemy_one = preload("res://components/enemy_one.tscn")
@onready var enemy_two = preload("res://components/enemy_two.tscn")
@onready var meteor = preload("res://components/meteor.tscn")
@onready var powerup = preload("res://components/powerup.tscn")

@onready var startPos = $lPoint
@onready var endPos = $rPoint
@onready var spawner_timer = $Timer

var spawn_interval_rate = 0.01
var min_spawn_time = 0.5

func _process(delta):
	if Global.game_on == true and Global.game_over == false:
		if spawner_timer.wait_time > min_spawn_time:
			spawner_timer.wait_time -= spawn_interval_rate *delta

func _on_timer_timeout():
	if Global.game_on == true and Global.game_over == false:
		var random_node_scene
		var power_up_chance = 0.05
		
		if randf() < power_up_chance:
			random_node_scene = powerup
		else:
			var node_to_spawn = [enemy_one, enemy_two, meteor]
			random_node_scene = node_to_spawn[randi() % node_to_spawn.size()]
		
		var new_node = random_node_scene.instantiate()
		var random_x = randf_range(startPos.global_position.x, endPos.global_position.x)
		new_node.global_position = Vector2(random_x, endPos.global_position.y)
		add_child(new_node)
