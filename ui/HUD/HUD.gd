extends Control

func _ready():
	signals.connect("game_start", self, "on_game_start")
	$Restart.connect("pressed", self, "on_restart")
	hide()

func on_game_start():
	show()

func on_restart():
	signals.emit_signal("reset_level")