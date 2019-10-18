extends "res://actors/pawn.gd"

onready var Grid = get_parent()

var target: Vector2

func _ready():
	set_physics_process(false)
	update_look_direction(Vector2(1, 0))

func _physics_process(delta):
	if position.distance_to(target) > 4:
		var direction = (target - position).normalized()
		move_and_slide( direction * 256)
	else:
		position = target
		set_physics_process(false)
		set_process(true)

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
	set_physics_process(true)
	$AnimationPlayer.play("walk")
	target = target_position

func bump():
	set_process(false)
	$AnimationPlayer.play("bump")
	yield($AnimationPlayer, "animation_finished")
	set_process(true)
