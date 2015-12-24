
extends RigidBody2D


var player_class = preload('res://scripts/player.gd')
export var laser_speed = 1000

# var sploder = preload('res://scenes/laser_splode.xml')

var laser_pos

func _ready():
	set_fixed_process(true)
	print("Laser parent: " + str(get_parent().get_name()))

func _fixed_process(delta):
	laser_pos = self.get_pos()
	laser_pos.y = laser_pos.y - laser_speed * delta
	self.set_pos(laser_pos)

	if laser_pos.y < 0:
		queue_free()
		print ("free")
#	_on_Area2D_body_enter(body)

	
func body_enter(body):
	
	if not body extends player_class:
		body.queue_free()
#		if body.has_method('mob_get_hit'):
#			body.mob_get_hit(self,1)
#			
#		var s = sploder.instance()
#		s.set_pos(get_pos())
#		get_parent().add_child(s)
		
		queue_free()
