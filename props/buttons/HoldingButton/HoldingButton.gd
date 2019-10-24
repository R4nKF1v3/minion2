extends "res://props/buttons/Button.gd"

export(bool) var can_disable_on_exit = true

var holders = []

func _on_Area2D_body_entered(body):
	if holders.empty():
		signals.emit_signal("enabled", elements_ids)
	holders.push_back(body)

func _on_Area2D_body_exited(body):
	holders.remove(holders.find(body))
	if can_disable_on_exit && holders.empty():
		signals.emit_signal("disabled", elements_ids)
