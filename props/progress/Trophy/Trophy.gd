extends "res://props/progress/StageTrigger.gd"

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		$Sprite.visible = false
		signals.emit_signal("trophy_picked_up")
