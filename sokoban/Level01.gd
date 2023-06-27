extends Node2D

var game_finish = false

func _process(delta):
	check_finish()

func check_finish():
	if !game_finish:
		var destinations = get_tree().get_nodes_in_group("dest")
		var finish_num = 0
		for destination in destinations:
			if destination.isActive == true:
				finish_num += 1
		if finish_num == destinations.size():
			game_finish = true
			print("game finish")
