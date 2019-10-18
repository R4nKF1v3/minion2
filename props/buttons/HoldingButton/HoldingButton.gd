extends "res://props/buttons/Button.gd"

var holders = []

func _on_Area2D_body_entered(body):
	if holders.empty():
		signals.emit_signal("enabled", elements_ids)
	holders.push_back(body)

func _on_Area2D_body_exited(body):
	holders.remove(holders.find(body))
	if holders.empty():
		signals.emit_signal("disabled", elements_ids)
