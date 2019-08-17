extends RigidBody


export(NodePath) var initial_position_path
var initial_position

func _ready():
	initial_position = get_node(initial_position_path)


func reset_to_initial_state():
	translation = initial_position.translation
	angular_velocity = Vector3(0,0,0)
	linear_velocity = Vector3(0,0,0)