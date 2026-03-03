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
