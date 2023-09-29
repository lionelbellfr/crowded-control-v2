extends "pawn.gd"

@export var bulletScene : PackedScene

@onready var Grid = get_parent()

var shoot_cooldown = false

func _ready():
	update_look_direction(Vector2(1, 0))

func _input(event):
	if event.is_action_pressed("debug"):
		print(get_owner().name)

func _process(delta):
	get_shoot_input()
	var input_direction = get_input_direction()
	if not input_direction:
		return
	update_look_direction(input_direction)

	var target_position = Grid.request_move(self, Vector2i(input_direction))
	if target_position:
		move_to(target_position)
	else:
		bump()

func get_shoot_input():
	if Input.is_action_pressed("shoot"):
		if !shoot_cooldown:
			shoot_cooldown = true
			shoot(bulletScene)
			await get_tree().create_timer(0.25).timeout
			shoot_cooldown = false

func get_input_direction():
	return Vector2(
		int(Input.is_action_pressed("walk_right")) - int(Input.is_action_pressed("walk_left")),
		int(Input.is_action_pressed("walk_down")) - int(Input.is_action_pressed("walk_up"))
	)


func update_look_direction(direction):
	$Sprite.rotation = direction.angle()


func move_to(target_position):
	var tween := create_tween().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN)
	set_process(false)
	$AnimationPlayer.play("walk")

	# Move the node to the target cell instantly,
	# and animate the sprite moving from the start to the target cell
	#var move_direction = (Vector2(target_position) - position).normalized()
	
	tween.tween_property(self,"position",Vector2(target_position),$AnimationPlayer.current_animation_length / 1.5)

	# Stop the function execution until the animation finished
	await $AnimationPlayer.animation_finished
	
	set_process(true)


func bump():
	set_process(false)
	$AnimationPlayer.play("bump")
	await $AnimationPlayer.animation_finished
	set_process(true)


func shoot(projectile: PackedScene) -> void:
	var bullet = projectile.instantiate() as Node2D
	bullet.position = self.global_position
	var bullet_direction = Vector2.RIGHT.rotated($Sprite.rotation)
	bullet.direction = bullet_direction
	add_child(bullet)
