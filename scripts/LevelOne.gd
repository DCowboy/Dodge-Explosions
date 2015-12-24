
extends Node



var rock = preload("res://scenes/rock.scn")
var rock_count = 0
var rock_array = []
var time_since_last_rock = 0



var Player
var player_pos
var mouse_pos


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	Player = get_node("Player")
	set_process(true)


func mouse_follow():
	mouse_pos = get_viewport().get_mouse_pos()
	Player.set_pos(mouse_pos)


func _process(delta):
	mouse_follow()
	
	
	time_since_last_rock += delta
	if time_since_last_rock > 1:
		new_rock()
		time_since_last_rock = 0
	
	var rock_id = 0
	for rock in rock_array:
		var rock_pos = get_node(rock).get_pos()
		rock_pos.y = rock_pos.y + 200 * delta
		get_node(rock).set_pos(rock_pos)
		if rock_pos.y > 1080:
			remove_child(get_node(rock))
			rock_array.remove(rock_id)
			print("dead rock")
		rock_id += 1


func new_rock():
	rock_count += 1
	var rock_instance = rock.instance()
	rock_instance.set_name("rock" + str(rock_count))
	add_child(rock_instance)
	print("Rock Parent: " + str(rock_instance.get_parent().get_name()))
	var rock_pos = get_node("rock" + str(rock_count)).get_pos()
	rock_pos.y = 10
	rock_pos.x = rand_range(0, 1080)
	get_node("rock" + str(rock_count)).set_pos(rock_pos)
	rock_array.push_back("rock" + str(rock_count))

func end_game():
	load("res://scenes/end_game.scn")

