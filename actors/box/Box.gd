extends "res://actors/pawn.gd"

onready var Grid = get_parent()

func handle_move_request(direction):
	var target_position = Grid.request_move(self, direction)
	if target_position:
		move_to(target_position)
		return true
	return false

func move_to(target_position):
	$Tween.interpolate_property(self, "position", position, target_position, 0.25, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()