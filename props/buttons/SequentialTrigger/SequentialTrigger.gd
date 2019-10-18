extends "res://props/buttons/Button.gd"

export(int) var id
export(Array, int) var toggle_ids = []
export(int) var delay_time = 1

onready var timer = $Timer

var holders = []
var index = 0

enum states {ENABLED, LOCKED, TRIGGER}
var state = states.ENABLED

func _ready():
	signals.connect("toggle_lock", self, "_on_toggle_lock")

func _on_Area2D_body_entered(body):
	match state:
		states.ENABLED:
			if holders.empty():
				state = states.LOCKED
				signals.emit_signal("toggle_lock", toggle_ids)
				if not elements_ids.empty():
					timer.start(delay_time)
					signals.emit_signal("enabled", [elements_ids[index]])
		states.TRIGGER:
			if holders.empty():
				state = states.ENABLED
				signals.emit_signal("toggle_lock", toggle_ids)
	holders.push_back(body)

func _on_Area2D_body_exited(body):
	holders.remove(holders.find(body))

func _on_toggle_lock(id_list):
	if id_list.has(id):
		match state:
			states.LOCKED:
				state = states.ENABLED
				timer.stop()
				if not elements_ids.empty():
					signals.emit_signal("disabled", [elements_ids[index]])
			states.ENABLED:
				state = states.TRIGGER

func _on_Timer_timeout():
	signals.emit_signal("disabled", [elements_ids[index]])
	if index + 1 > elements_ids.size() - 1:
		index = 0
	else:
		index += 1
	signals.emit_signal("enabled", [elements_ids[index]])
