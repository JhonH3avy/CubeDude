extends KinematicBody

var motion = Vector3()

const UP = Vector3(0,1,0)
const GRAVITY = -5
const EPSILON = 0.1

export var player_number = "1"

export var speed = 10

export var color_material : Material


func _ready():
	$"Armature/Skeleton/Cube Dube".set_surface_material(0,color_material)


func _physics_process(delta):
	move()
	fall()


func _process(delta):
	animate()
	face_forward()


func animate():
	if abs(motion.x) > EPSILON or abs(motion.z) > EPSILON:
		if not $AnimationPlayer.is_playing():
			$AnimationPlayer.play("Arms Cross Walk")
	else:
		if $AnimationPlayer.is_playing():
			$AnimationPlayer.stop(false)


func face_forward():
	if not motion.x == 0 or not motion.z == 0:
		look_at(Vector3(translation.x - motion.x, 0, translation.z - motion.z), UP)


func move():
	if Input.is_action_pressed("left_" + player_number) and not Input.is_action_pressed("right_" + player_number):
		motion.x = -1
	elif Input.is_action_pressed("right_" + player_number) and not Input.is_action_pressed("left_" + player_number):
		motion.x = 1
	else:
		motion.x = 0
	if Input.is_action_pressed("down_" + player_number) and not Input.is_action_pressed("up_" + player_number):
		motion.z = 1
	elif Input.is_action_pressed("up_" + player_number) and not Input.is_action_pressed("down_" + player_number):
		motion.z = -1
	else:
		motion.z = 0
	
	move_and_slide(motion.normalized() * speed, UP)


func fall():
	if is_on_floor():
		motion.y = 0
	else:
		motion.y = GRAVITY