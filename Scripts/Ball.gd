extends RigidBody


export(NodePath) var initial_position_path
var initial_position

func _ready():
	initial_position = get_node(initial_position_path)


func reset_to_initial_state():
	translation = initial_position.translation


func on_stop_game():
	linear_velocity = Vector3(0,0,0)
	angular_velocity = Vector3(0,0,0)


func _on_Ball_body_entered(body):
	if not $HitSound.playing and body is KinematicBody:
		$HitSound.play()
