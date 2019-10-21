extends "res://props/progress/StageTrigger.gd"

var enabled = false

func _ready():
	signals.connect("trophy_picked_up", self, "_on_trophy_picked")

func _on_Area2D_body_entered(body):
	if enabled and body.name == "Player":
		signals.emit_signal("level_end")
		$Timer.start()

func _on_trophy_picked():
	enabled = true
	$AnimationPlayer.play("open")

func _on_Timer_timeout():
	signals.emit_signal("pause")

