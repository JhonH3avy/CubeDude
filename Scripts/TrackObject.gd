extends Camera

export(NodePath) var pathToTarget

const UP = Vector3(0,1,0)

var target


func _ready():
	target = get_node(pathToTarget)


func _process(delta):
	#look_at(target.transform.origin, UP)
	translation.x = lerp(target.transform.origin.x, translation.x, 0.1)