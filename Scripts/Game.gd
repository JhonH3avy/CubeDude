extends Spatial


var scores = {
	1: 0,
	2: 0
}


func report_goal(player_number):
	scores[player_number] += 1
	get_tree().call_group("score_player" + str(player_number), 
			"update_score", str(scores[player_number]))
	get_tree().call_group("celebration", "start_celebration")
	$CelebrationTimer.start()
	
	
func reset_scene():
	get_tree().call_group("goal_made", "reset_to_initial_state")
	

func _on_CelebrationTimer_timeout():
	reset_scene()