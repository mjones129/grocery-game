extends CharacterBody2D

@export var speed = 200
@export var rotation_speed = 1.5
@export var acc = Vector2(1, 1)

#initial starting location
var target = Vector2(200, 300)



func _input(event):
	# Use is_action_pressed to only accept single taps as input instead of mouse drags.
	if event.is_action_pressed(&"click"):
		target = get_global_mouse_position()
		#get the rotation of the shopper
		var old_angle = get_rotation()
		print("target: ", target)
		print("get rotation: ", old_angle)
		#print("new angle: ", new_angle)
		#look_at(target)
		#rotation = get_global_mouse_position().angle_to_point(position)
		print("angle to point: ", rotation)
		#var diff = lerp(old_angle, rotation, 1)
		#print("diff: ", diff)

func _physics_process(delta):
	#var accel = position.direction_to(target) * acc
	#velocity = min(accel, speed)
	velocity = position.direction_to(target) * speed
	var angle = (target - self.global_position).angle()
	var rot_speed = delta * rotation_speed
	self.global_rotation = lerp_angle(self.global_rotation, angle, rot_speed)
	#look_at(target)
	if position.distance_to(target) > 10:
		move_and_slide()
