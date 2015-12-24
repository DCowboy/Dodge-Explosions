
extends KinematicBody2D


export var hp = 100


var blue_laser = preload("res://scenes/blue_laser.scn")
var is_fire_pressed = false

func _ready():
	set_fixed_process(true)
	print("Ship Parent: " + str(get_parent().get_name()))
func _fixed_process(delta):
	if Input.is_action_pressed("fire"):
		if is_fire_pressed == false:
			fire()
		is_fire_pressed = true
	else:
		is_fire_pressed = false
	
	if is_colliding():
		lose_health()
		print (hp)


func lose_health():
	print("health")
	hp -= 10
	print(hp)
	
func fire():
	var laser_instance = blue_laser.instance()
	get_parent().add_child(laser_instance)
	PS2D.body_add_collision_exception(laser_instance.get_rid(),self.get_rid())
	var player_pos = self.get_pos()
	var laser_pos = laser_instance.set_pos(player_pos)
