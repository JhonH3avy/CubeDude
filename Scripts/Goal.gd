extends StaticBody


export var player_that_can_make_goal : int

var can_make_goal = true


func report_goal():
	if not can_make_goal:
		return
	can_make_goal = false
	get_tree().call_group("game_manager", "report_goal", player_that_can_make_goal)


func reset_to_initial_state():
	can_make_goal = true


func _on_GoalArea_body_entered(body):
	report_goal()
