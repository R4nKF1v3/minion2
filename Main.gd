extends Node

var levels = []
var current

func _ready():
	load_levels()
	signals.connect("game_over", self, "on_game_over")
	signals.connect("reset_level", self, "on_reset_level")
	signals.connect("next_level", self, "on_next_level")
	signals.connect("game_start", self, "on_game_start")
	signals.connect("pause", self, "on_pause")
	get_tree().paused = true

func load_levels():
	levels.push_back(preload("res://levels/Nivel01/Level01.tscn"))
	levels.push_back(preload("res://levels/Nivel02/Level02.tscn"))
	levels.push_back(preload("res://levels/EndCard/EndCard.tscn"))
	
	current = levels.pop_front()

func on_reset_level():
	var new_scene = current.instance()
	var old_scene = $Levels.get_child(0)
	$Levels.remove_child(old_scene)
	$Levels.add_child(new_scene)
	old_scene.queue_free()
	get_tree().paused = false

func on_next_level():
	current = levels.pop_front()
	on_reset_level()

func on_game_over():
	get_tree().paused = true

func on_game_start():
	get_tree().paused = false

func on_pause():
	get_tree().paused = true