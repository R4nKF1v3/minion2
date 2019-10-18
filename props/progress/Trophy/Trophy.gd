extends "res://props/progress/StageTrigger.gd"

var holders : = []

func _on_Area2D_body_entered(body):
	holders.push_front(body)
	$Sprite.visible = false

func _on_Area2D_body_exited(body):
	holders.remove(holders.find(body))
	if holders.empty():
		signals.emit_signal("enable_wof")
		queue_free()