extends "res://props/progress/StageTrigger.gd"

export(int) var speed = 30

func _ready():
	set_physics_process(false)
	signals.connect("enable_wof", self, "_on_enabled")
	signals.connect("level_end", self, "_on_level_end")

func _physics_process(delta):
	position.x -= speed * delta

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		signals.emit_signal("game_over")

func _on_enabled():
	set_physics_process(true)

func _on_level_end():
	set_physics_process(false)
	