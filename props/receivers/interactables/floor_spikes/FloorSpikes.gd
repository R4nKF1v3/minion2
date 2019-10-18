extends "res://props/receivers/interactables/Interactable.gd"

onready var spike_triggered_tx = load("res://props/receivers/interactables/floor_spikes/sprites/spikes_triggered.png")
onready var spike_sheated_tx = load("res://props/receivers/interactables/floor_spikes/sprites/spikes_sheated.png")

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		signals.emit_signal("game_over")

func _on_enabled_call(id_list):
	if id_list.has(id):
		$Area2D/CollisionShape2D.call_deferred("set_disabled", false)
		$Sprite.texture = spike_triggered_tx

func _on_disabled_call(id_list):
	if id_list.has(id):
		$Area2D/CollisionShape2D.call_deferred("set_disabled", true)		
		$Sprite.texture = spike_sheated_tx
