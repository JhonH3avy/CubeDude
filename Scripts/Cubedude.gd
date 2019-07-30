extends KinematicBody

var motion = Vector3()

const UP = Vector3(0,1,0)
const GRAVITY = -5

export var speed = 3
export var max_speed = 10

func _physics_process(delta):
	move()
	fall()


func move():
	if Input.is_action_pressed("left_1") and not Input.is_action_pressed("right_1"):
		motion.x = clamp(motion.x - speed, -max_speed, max_speed)
	elif Input.is_action_pressed("right_1") and not Input.is_action_pressed("left_1"):
		motion.x = clamp(motion.x + speed, -max_speed, max_speed)
	else:
		motion.x = lerp(motion.x, 0, 0.25)
	if Input.is_action_pressed("down_1") and not Input.is_action_pressed("up_1"):
		motion.z = clamp(motion.z + speed, -max_speed, max_speed)
	elif Input.is_action_pressed("up_1") and not Input.is_action_pressed("down_1"):
		motion.z = clamp(motion.z - speed, -max_speed, max_speed)
	else:
		motion.z = lerp(motion.z, 0, 0.25)
	
	move_and_slide(motion, UP)


func fall():
	if is_on_floor():
		motion.y = 0
	else:
		motion.y = GRAVITY