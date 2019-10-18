extends "res://props/progress/StageTrigger.gd"

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		signals.emit_signal("level_end")
		$AnimationPlayer.play("open")
		yield($AnimationPlayer, "animation_finished")
		signals.emit_signal("pause")
