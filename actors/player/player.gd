extends "res://actors/pawn.gd"

onready var Grid = get_parent()

func _ready():
	update_look_direction(Vector2(1, 0))


func _process(_delta):
	var input_direction = get_input_direction()
	if not input_direction:
		return
	update_look_direction(input_direction)

	var target_position = Grid.request_move(self, input_direction)
	if target_position:
		move_to(target_position)
	else:
		bump()


func get_input_direction():
	var hor = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	var ver = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	if hor:
		return Vector2(hor, 0)
	elif ver:
		return Vector2(0, ver)
	else:
		return Vector2.ZERO


func update_look_direction(direction):
	$Sprite.rotation = direction.angle()
	$CollisionPolygon2D.rotation = direction.angle()


func move_to(target_position):
	set_process(false)
	$AnimationPlayer.play("walk")

	var move_direction = (target_position - position).normalized()
	$Tween.interpolate_property(self, "position", position, target_position, $AnimationPlayer.current_animation_length, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()

	# Stop the function execution until the animation finished
	yield($AnimationPlayer, "animation_finished")
	
	set_process(true)


func bump():
	set_process(false)
	$AnimationPlayer.play("bump")
	yield($AnimationPlayer, "animation_finished")
	set_process(true)
