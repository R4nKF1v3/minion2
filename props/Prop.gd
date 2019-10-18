extends Node2D

func _ready():
	signals.connect("enabled", self, "_on_enabled_call")
	signals.connect("disabled", self, "_on_disabled_call")

func _on_enabled_call(id_list):
	pass

func _on_disabled_call(id_list):
	pass