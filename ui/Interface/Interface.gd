extends Control

func _ready():
	signals.connect("game_over", self, "on_game_over")
	signals.connect("level_end", self, "on_level_end")
	signals.connect("reset_level", self, "on_level_reset")

func on_level_reset():
	if visible:
		$Next.visible = false
		visible = false

func on_game_over():
	$MainTitle.text = "Try again"
	visible = true

func on_level_end():
	$MainTitle.text = "Well done, onto the next one!"
	visible = true
	$Next.visible = true


func _on_Start_pressed():
	signals.emit_signal("game_start")
	$Start.visible = false
	visible = false

func _on_Next_pressed():
	signals.emit_signal("next_level")
	$Next.visible = false
	visible = false
