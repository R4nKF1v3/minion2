extends "res://props/buttons/Button.gd"

export(int) var delay_time = 1
onready var timer = $Timer

var holders = []
var index = 0

func _on_Area2D_body_entered(body):
	if holders.empty():
		timer.start(delay_time)
		signals.emit_signal("enabled", [elements_ids[index]])
	holders.push_back(body)

func _on_Area2D_body_exited(body):
	holders.remove(holders.find(body))
	if holders.empty():
		timer.stop()
		signals.emit_signal("disabled", [elements_ids[index]])
		index = 0

func _on_Timer_timeout():
	signals.emit_signal("disabled", [elements_ids[index]])
	if index + 1 > elements_ids.size() - 1:
		index = 0
	else:
		index += 1
	signals.emit_signal("enabled", [elements_ids[index]])
